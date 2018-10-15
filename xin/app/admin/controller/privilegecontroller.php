<?php
namespace Xin\App\Admin\Controller;

use Phalcon\Db;
use Phalcon\Logger;
use Xin\App\Admin\Model\Access;
use Xin\App\Admin\Model\Privilege;
use Xin\App\Admin\Model\Account;
use Xin\App\Admin\Model\Role;
use Xin\Lib\SqlHelper;
use Xin\Lib\Utils;
use Xin\App\Admin\Lib\Tree;
use Xin\App\Admin\Model\Menu;
use Xin\App\Admin\Model\AccountToRole;

class PrivilegeController extends basecontroller
{
    private $groups=array('page'=>'页面','data'=>'数据','action'=>'动作');

    public function indexAction()
    {
        $group = $this->request->get('group');

        if (!isset($this->groups[$group])) {
            reset($this->groups);
            $group = key($this->groups);
        }

        $privileges = Privilege::find(array('grouptype=?0', 'bind' => array($group), 'order' => 'accesskey asc'))->toArray();

        $this->view->setVars(array(
            'groups'=>$this->groups,
            'group' => $group,
            'privileges' => $privileges
        ));
    }

    /**
     * 创建权限
     */
    public function createAction()
    {
        if ($this->request->isPost()) {
            $privilege = new Privilege();
            
            try{
                if (!$privilege->save($_POST)) {
                    $this->di->get('logger')->error(implode(';',$privilege->getMessages()));
                }else{
                    return new \Xin\Lib\MessageResponse('信息已保存','succ');
                }
            }catch (\Exception $e) {
                $this->di->get('logger')->error($e->getMessage());
            }          
            
            return new \Xin\Lib\MessageResponse('保存失败');
        }
    }

    /**
     * 编辑权限
     */
    public function editAction()
    {
        $id = $this->request->get('id', 'int');
        if (!$privilege = Privilege::findFirstById($id)) {
            return new \Xin\Lib\MessageResponse('无效的记录');
        }
        if ($this->request->isPost()) {
            try{
                if (!$privilege->save($_POST)) {
                    $this->di->get('logger')->error(implode(';',$privilege->getMessages()));
                }else{
                    return new \Xin\Lib\MessageResponse('信息已保存','succ');
                }
            }catch (\Exception $e) {
                $this->di->get('logger')->error($e->getMessage());
            }          
            
            return new \Xin\Lib\MessageResponse('保存失败');
        }
        $this->view->setVar('objData', $privilege);
    }

    /**
     * 删除权限
     */
    public function deleteAction()
    {
        $id = $this->request->getPost('id', 'int');
        if ($id < 1 || !$privilege = Privilege::findFirst(array('id=?0', 'bind' => array($id)))) {                
            return new \Xin\Lib\MessageResponse('错误的参数');
        }
        if($privilege->grouptype==Privilege::COLUMN_GROUPTYPE_PAGE && Menu::count(['privilege=?0','bind'=>[$id]])>0){              
            return new \Xin\Lib\MessageResponse('有菜单关联该权限项，无法直接删除');
        }

        try {
            if (!$privilege->delete()) {
                $this->di->get('logger')->error(implode(';',$privilege->getMessages()));  
            }else{                
                return new \Xin\Lib\MessageResponse('信息已保存','succ');
            }
        } catch (\Exception $e) {
            $this->di->get('logger')->error($e->getMessage());
        }
        
        return new \Xin\Lib\MessageResponse('保存失败');
    }


    /**
     * 给用户授权
     */
    public function awardRoleAction()
    {
        $roleid = $this->request->getQuery('id', 'int');
        if ($roleid < 1 || !$role = Role::findFirstById($roleid)) {
            return new \Xin\Lib\MessageResponse('指定的角色不存在');
        }

        if ($this->request->getPost('dosubmit')) {
            $privilegeIdList = $this->request->getPost('privilege');
            if (!is_array($privilegeIdList) || !$privilegeIdList) {
                return new \Xin\Lib\MessageResponse('请至少选择一项权限！');
            }

            if (!Utils::isNumericArray($privilegeIdList) || count($privilegeIdList) != Privilege::count(['id in ({id:array})','bind'=>[$privilegeIdList]])) {
                return new \Xin\Lib\MessageResponse('privilege的值非法');
            }
            $access = new Access(); 
            $flag=(function() use($access,$privilegeIdList,$roleid){
                $conn = $access->getWriteConnection();
                try {    
                    $conn->begin();     
                    //删除原有  
                    if (!$conn->delete($access->getSource(), 'object_type=? and object_value=?', [Access::COLUMN_OBJECTTYPE_ROLE, $id])) {
                        $this->di->get('logger')->error('deleting access fail');
                        return;
                    }
                    foreach ($privilegeIdList as $p) {
                        $access = new Access();
                        $access->object_type = Access::COLUMN_OBJECTTYPE_ROLE;
                        $access->object_value = $roleid;
                        $access->privilege_id = $p;
                        $access->isallow = 1;
                        if (!$access->save()) {
                            $this->di->get('logger')->error(implode(';', $access->getMessages()));
                            return;
                        }
                    }
                } catch (\Exception $e) {
                    $conn->rollback();
                    $this->di->get('logger')->error($e->getMessage());
                    return false;
                }
                return $conn->commit();
            })();

            return $flag ? new \Xin\Lib\MessageResponse('信息变更已保存','succ') : new \Xin\Lib\MessageResponse('信息变更保存失败');

            
        }
        
        $oldAccess = Access::find([
            'object_type=?0 and object_value=?1',
            'bind' => [Access::COLUMN_OBJECTTYPE_ROLE, $id],
            'order' => 'isallow desc'
        ]);
        $oldAllowPrivilegeIds = array();//整理一份仅包含允许的清单
        foreach ($oldAccess as $acc) {
            if($acc->isallow){
                $oldAllowPrivilegeIds[$acc->privilege_id]=1;
            }
        }
        $oldAllowPrivilegeIds = array_keys($oldAllowPrivilegeIds);
        $privileges = Privilege::find(['order' => 'accesskey asc'])->toArray();

        $this->view->setVar('privileges', $privileges);        
        $this->view->setVar('oldAllowPrivilegeIds', $oldAllowPrivilegeIds);
        $this->view->pick("privilege/award");

    }


    /**
     * 处理用户授权，用户授权=角色A | 角色B & 用户权限
     */
    public function awardUserAction()
    {
        $uid = $this->request->getQuery('id', 'int');
        if ($uid < 1 || !$user = Account::findFirstByUid($uid)) {
            return new \Xin\Lib\MessageResponse('指定的用户不存在');
        }
        if ($this->request->getPost('dosubmit')) {
            $privilegeIdList = $this->request->getPost('privilege');
            if (!is_array($privilegeIdList) || !$privilegeIdList) {
                return new \Xin\Lib\MessageResponse('错误的参数privilege');
            }
            //取出数据库中对应权限项信息
            $privileges = Privilege::findFillWithKey('id', ['id in ({id:array})','bind'=>['id'=>$privilegeIdList]]);
            foreach ($privilegeIdList as $p) {
                if (!is_numeric($p) || $p < 1 || !$privileges[$p]) {
                    return new \Xin\Lib\MessageResponse('privilege的值非法');
                }
            }
            $access = new Access(); 
            $flag=(function() use($access,$privilegeIdList,$uid){
                $conn = $access->getWriteConnection();
                try {    
                    $conn->begin();     
                    //删除原有  
                    if (!$conn->delete($access->getSource(), 'object_type=? and object_value=?', [Access::COLUMN_OBJECTTYPE_USER, $uid])) {
                        $this->di->get('logger')->error('deleting access fail');
                        return;
                    }
                    foreach ($privilegeIdList as $p) {
                        $access = new Access();
                        $access->object_type = Access::COLUMN_OBJECTTYPE_USER;
                        $access->object_value = $uid;
                        $access->privilege_id = $p;
                        $access->isallow = 1;
                        if (!$access->save()) {
                            $this->di->get('logger')->error(implode(';', $access->getMessages()));
                            return;
                        }
                    }
                } catch (\Exception $e) {
                    $conn->rollback();
                    $this->di->get('logger')->error($e->getMessage());
                    return false;
                }
                return $conn->commit();
            })();

            return $flag ? new \Xin\Lib\MessageResponse('信息变更已保存','succ') : new \Xin\Lib\MessageResponse('信息变更保存失败');
        }

        $res = AccountToRole::findByUser_id($uid);
        $roleidList = [];
        if($res){
            foreach ($res->toArray() as $v) {
                $roleidList[] = $v['role_id'];
            }
        }
        //选出目前数据库中这个用户及其角色下所有允许/不允许的授权清单
        $oldAccess = Access::find([
            '(object_type=?0 and object_value=?1) or (object_type=?2 and object_value in ({object_value:array}))',
            'bind' => [Access::COLUMN_OBJECTTYPE_USER, $id,Access::COLUMN_OBJECTTYPE_ROLE,'object_value'=>$roleidList],
            'order' => 'object_type asc,isallow desc'
        ]);
        $oldAllowPrivilegeIds = array();//整理一份仅包含允许的清单
        foreach ($oldAccess as $acc) {
            if($acc->isallow){
                $oldAllowPrivilegeIds[$acc->privilege_id]=1;
            }else{
                if($acc->object_type==Access::COLUMN_OBJECTTYPE_USER){
                    unset($oldAllowPrivilegeIds[$acc->privilege_id]);
                }
            }
        }
        $oldAllowPrivilegeIds = array_keys($oldAllowPrivilegeIds);
        $privileges = Privilege::find(['order' => 'accesskey asc'])->toArray();

        $this->view->setVar('privileges', $privileges);        
        $this->view->setVar('oldAllowPrivilegeIds', $oldAllowPrivilegeIds);
        $this->view->pick("privilege/award");
    }

    public function importAction()
    {
        $privs = array();
        $groupSn='action';
        $oldPivs =[] ;
        foreach(Privilege::find() as $r){
        	$oldPrivs[$r->accesskey]=$r->toArray();
        }
        $func_genPrivItem = function ($d) {
            $d['accesskey'] = "{$d['m']}/{$d['c']}/{$d['a']}";
            return $d;
        };
        $appdir=XIN_DIR.'/app/';
        foreach (scandir($appdir) as $appDir) {
            if ($appDir == '.' || $appDir == '..' || !is_dir($appdir . $appDir) || $appDir!='admin') continue;

            $priv_m = array('m' => strtolower($appDir), 'c' => '*', 'a' => '*');
            $privs[] = $func_genPrivItem($priv_m);

            if (!is_dir($appdir . $appDir . '/controller')) continue;

            foreach (glob($appdir . $appDir . '/controller/*.php') as $ctrl) {
                $class = basename($ctrl);
                $class = substr($class, 0, strrpos($class, '.'));
                $priv_c = $priv_m;
                $priv_c['c'] = strtolower(substr($class, 0, -10));
                $privs[] = $func_genPrivItem($priv_c);
                $f = fopen($ctrl, 'r');
                do {
                    $line = fgets($f);
                    if ($line && preg_match('/namespace\s+([^;]+);/', $line, $m)) {
                        $namespace = '\\' . $m[1];
                        include_once $ctrl;
                        $ref = new \ReflectionClass($namespace . '\\' . $class);
                        $priv_a = $priv_c;
                        foreach ($ref->getMethods(\ReflectionMethod::IS_PUBLIC) as $method) {
                            if (substr($method->name, -6) == 'Action') {
                                $priv_a['a'] = strtolower(substr($method->name, 0, -6));
                                if (!$oldPivs[implode('/', $priv_a)]) $privs[] = $func_genPrivItem($priv_a);
                            }
                        }
                        break;
                    }
                } while ($line);
                fclose($f);
            }
        }

        foreach ($privs as $priv) {
            try {
                $p = new Privilege();
                $p->save(array('groupsn' => $groupSn, 'accesskey' => $priv));
            } catch (\Exception $e) {
            }
        }
        $this->view->setVar('newPrivileges',$privs);
    }

    public function chooseareaAction(){
        
    }
}
