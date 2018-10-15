<?php
namespace Xin\App\Admin\Controller;

use Xin\App\Admin\Model\Role;
use Xin\App\Admin\Model\Access;
use Xin\Lib\SqlHelper;
use Xin\Lib\Utils;
use Xin\App\Admin\Model\Menu;
use Xin\App\Admin\Model\AccountToRole;
use Xin\App\Admin\Model\Privilege;
use Xin\Lib\MessageResponse;

class RoleController extends basecontroller
{

    public function listAction()
    {
        $keyword = SqlHelper::escapeLike( $this->request->get("keyword","striptags"));
        $this->view->setVar('keyword', $keyword);
        $build = new \Phalcon\Mvc\Model\Query\Builder();
        $build = $build->from(['r' => 'admin:role'])
            ->columns('count(*) as count');
        if ($keyword) {
            $build = $build->where('r.rolename like :keyword:', ['keyword' => '%' . $keyword . '%']);
        }
        $count = $build->getQuery()->execute()->getFirst()['count'];

        $pagination = Utils::loadUserControl('\Xin\Lib\Ctrl\Pagination');
        $pagination->recordCount($count);
        $this->view->setVar('pagination', $pagination);

        if($this->request->get("page","int",1) > $pagination->pageCount()){  $pagination->pageIndex($pagination->pageCount()) ; }
        list($start,$limit) = Utils::offset($pagination->pageIndex(),$pagination->pageSize());
        if (!$pagination->recordCount() || $start >= $pagination->recordCount()) {
            return;
        }

        $rs = $build->columns('*')
            ->orderBy('r.id desc')
            ->limit($limit, $start)
            ->getQuery()
            ->execute();
        $this->view->setVar('objectlist', $rs->toArray());
    }

    public function createAction()
    {
        if ($this->request->isPost()) {
            $role = new Role();
            try {
                if (!$role->save($_POST)) {
                    throw new \Exception(implode(";", $role->getMessages()));
                } else {
                    $this->view->setVar('isSaved', 1);
                    // return new MessageResponse('数据已保存', 'succ');
                }
            } catch (\Exception $e) {
                $this->di->get('logger')->error($e->getMessage());
                return new MessageResponse("保存数据失败");
            }
        }
    }

    public function deleteAction()
    {
        $id = $this->request->getPost('id', 'int');
        if ($id < 1 || !$role = Role::findFirstById($id)) {
            return new MessageResponse('错误的参数');
        }
        if(AccountToRole::findFirstByRole_id($id)) return new MessageResponse("该角色下存在管理员用户");
        $conn=$this->db;
        $this->db->begin();
        // 执行一些操作
        $flag = (function () use ($conn,$role,$id) {
            try {
                if (!$role->delete()) {
                    $this->di->get('logger')->error(implode(';', $role->getMessages()));
                    return;
                }
                /*$AccountToRole=new AccountToRole();
                if (!$conn->delete($AccountToRole->getSource(), 'role_id=?', [$id])) {
                    $this->di->get('logger')->error('deleting AccountToRole fail');
                    return;
                }*/
                $access=new Access();
                if (!$conn->delete($access->getSource(), 'object_type=? and object_value=?', [Access::COLUMN_OBJECTTYPE_USER, $id])) {
                    $this->di->get('logger')->error('deleting Access fail');
                    return;
                }

            } catch (\Exception $e) {
                $this->di->get('logger')->error($e->getMessage());
                return false;
            }
            return true;
        })();


        if ($flag && $conn->commit()) {
            return new MessageResponse("信息已删除", 'succ');
        } else {
            $conn->rollback();
            return new MessageResponse("保存失败");
        }
    }

    public function editAction()
    {
        $id = $this->request->get('id', 'int');
        if (!$role = Role::findFirstById($id)) {
            return new MessageResponse('无效的记录');
        }
        if ($this->request->isPost()) {
            $data = [];
            $data['rolename'] = $_POST['rolename'];
            $data['description'] = $_POST['description'];
            $data['status'] = intval($_POST['status']);
            try {
                if (!$role->save($data)) {
                    $this->di->get('logger')->error(implode(';', $role->getMessages()));
                    return new MessageResponse('保存失败');
                } else {
                    // return new MessageResponse('信息已保存', 'succ');
                    $this->view->setVar('isSaved', 1);
                }
            } catch (\Exception $e) {
                $this->di->get('logger')->error($e->getMessage());
                return new MessageResponse('保存失败');
            }
        }else{
            $this->view->setVar('id', $id);
            $this->view->setVar('objData', $role->toArray());
        }
    }

    /**
     * 校验角色名称唯一性
     */
    public function checkuniqueAction()
    {
        $id = $this->request->getQuery('id', 'int', 0);
        $rolename = $this->request->getQuery('rolename');
        if(empty($rolename)){
            exit(json_encode(array('status'=>'err','message'=>'角色名称参数不能为空')));
        }
        $where = "rolename = :rolename:";
        if($id) $where .= " AND id != ".$id;
        $check_rolename = Role::findFirst(array(
            $where,
            "bind" => ["rolename"=>$rolename],
        ));
        if($check_rolename) exit(json_encode(array('valid'=>false,'message'=>'该角色名称已被使用')));
        exit(json_encode(array('valid'=>true,'message'=>'正确')));
    }

    /**
     * 给角色分配权限
     */
    public function privilegeAction(){
        $id = $this->request->get('id', 'int');
        if (!$role = Role::findFirstById($id)) {
            return new MessageResponse('无效的记录');
        }
        if ($this->request->getPost('dosubmit')) {
            $data = [];
            $role_nodes=$_POST['role_nodes'];
            if (empty($role_nodes) || !preg_match('/^[0-9,]+$/', $role_nodes)) return new MessageResponse("角色权限节点错误");
            $node_ids=explode(",",$role_nodes);//角色权限节点数组
            $access = new Access();
            $res = $access->editRoleNodes($id,$node_ids);
            if(!$res) return new MessageResponse("修改角色权限失败。");
            $this->view->setVar('isSaved', 1);
        }else{
//            $menu_tree = \Xin\App\Admin\Service\Acl::getMenuTree();
            $menu_tree = (new \Xin\App\Admin\Service\Acl())->getMenuTree();
            $node_html="";
            foreach($menu_tree as $i=>$node){
                \Xin\App\Admin\Lib\Utils::createRoleNodeHtml($node_html,$node);
            }
            // 取当前角色的权限
            $role_access = Access::find([
                'columns' => 'menu_id', 
                'conditions' => " object_value = :object_value: AND object_type = 'Role' ",
                'bind' => [
                  'object_value' => $id,
                ]
            ]);
            $role_access_arrray = [];
            if($role_access && $role_access->toArray()){
                foreach ($role_access->toArray() as $v) {
                    $role_access_arrray[] = $v['menu_id'];
                }
            }
            $json_role_node = '[0]';
            if(!empty($role_access_arrray)){
                $json_role_node = json_encode($role_access_arrray);
            }

            $this->view->setVar('role_access_arrray', $role_access_arrray);
            $this->view->setVar('json_role_node', $json_role_node);
            $this->view->setVar('menu_tree', json_encode($menu_tree));
            $this->view->setVar('node_html', $node_html);
        }
    }

    public function awardAction()
    {
        $id = $this->request->getQuery('id', 'int');
        if ($id < 1 || !$role = Role::findFirstById($id)) {
            return new MessageResponse('指定的角色不存在');
        }

        if ($this->request->getPost('dosubmit')) {
            $privilegeIdList = $this->request->getPost('privilege');
            if (!is_array($privilegeIdList) || !$privilegeIdList) {
                return new MessageResponse('请至少选择一项权限！');
            }

            if (!Utils::isNumericArray($privilegeIdList)) {
                return new MessageResponse('privilege的值非法');
            }
            $menus = Menu::find(['id in ({id:array})','bind'=>['id'=>$privilegeIdList]])->toArray();
            if (!$menus || count($privilegeIdList) != count($menus)) {
                return new MessageResponse('privilege的值非法');
            }
            $access = new Access();
            $flag = (function () use ($access, $menus, $id) {
                $conn = $access->getWriteConnection();
                try {
                    $conn->begin();     
                    //删除原有  
                    if (!$conn->delete($access->getSource(), 'object_type=? and object_value=? and access_type=?', [Access::COLUMN_OBJECTTYPE_ROLE, $id, Access::COLUMN_ACCESSTYPE_PAGE])) {
                        $this->di->get('logger')->error('deleting access fail');
                        return;
                    }
                    foreach ($menus as $p) {
                        $access = new Access();
                        $access->object_type = Access::COLUMN_OBJECTTYPE_ROLE;
                        $access->object_value = $id;
                        if ($i = strpos($p['url'], '#')) {
                            $p['url'] = substr($p['url'], 0, $i);
                        }
                        $i = strpos($p['url'], '?');
                        if ($i === false) {
                            $access->access_key = $p['url'];
                            $access->access_data = '';
                        } else {
                            $access->access_key = substr($p['url'], 0, $i);
                            $access->access_data = substr($p['url'], $i + 1);
                        }
                        $access->access_type = Access::COLUMN_ACCESSTYPE_PAGE;
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

            return $flag ? new MessageResponse('信息变更已保存', 'succ') : new MessageResponse('信息变更保存失败');
        }

        $rs = Access::find([
            'object_type=?0 and object_value=?1 and access_type=?2',
            'column' => 'isallow,id,access_key,access_data',
            'bind' => [Access::COLUMN_OBJECTTYPE_ROLE, $id, Access::COLUMN_ACCESSTYPE_PAGE],
            'order' => 'isallow desc'
        ]);
        $access = [];
        foreach ($rs as $r) {
            $acc=$r->access_key.($r->access_data?'?'.$r->access_data:'');
            $access[$acc]=$r->isallow?true:false;
        }
        $menus = Menu::find(['order' => 'listorder asc'])->toArray();
        $privileges=Privilege::find(array('order' => 'accesskey asc'))->toArray();
        foreach ($privileges as &$p) {
            list($p['m'], $p['c'], $p['a']) = explode('/', $p['accesskey']);
        }
        
        $this->view->setVar('menus', $menus);
        $this->view->setVar('privilegeList', $privileges);
        $this->view->setVar('acceessList', $access);
    }
}