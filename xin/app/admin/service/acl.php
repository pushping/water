<?php
namespace Xin\App\Admin\Service;

use Xin\Lib\SqlHelper;
use Xin\App\Admin\Service\Auth as auth;
use Xin\App\Admin\Model\Menu;
use Xin\App\Admin\Model\Access;
use Xin\App\Admin\Model\Privilege;
use Xin\Lib\Utils;
use Xin\App\Admin\Lib\Utils as AdminUtils;

class Acl extends \Phalcon\Di\Injectable implements \Phalcon\Acl\AdapterInterface
{
    private $_rootUserId = 1;
    private $_publicAccessKeys = array();
    protected $_defaultAccess = 0;
    protected $_accessList;

    public function setDefaultAction($defaultAccess)
    {
        $this->_defaultAccess = $defaultAccess;
    }

    /**
     * Returns the default ACL access level
     */
    public function getDefaultAction()
    {
        return $this->_defaultAccess;
    }

    /**
     * Adds a role to the ACL list. Second parameter lets to inherit access data from other existing role
     * @return bool
     */
    public function addRole($role, $accessInherits = null)
    {
    }

    /**
     * Do a role inherit from another existing role
     * @return bool
     */
    public function addInherit($roleName, $roleToInherit)
    {
    }

    /**
     * Check whether role exist in the roles list
     * @return bool
     */
    public function isRole($roleName)
    {
    }

    /**
     * Check whether resource exist in the resources list
     * @return bool
     */
    public function isResource($resourceName)
    {
    }

    /**
     * Adds a resource to the ACL list
     *
     * Access names can be a particular action, by example
     * search, update, delete, etc or a list of them
     * @return bool
     */
    public function addResource($resourceObject, $accessList)
    {
    }

    /**
     * Adds access to resources
     * @return bool
     */
    public function addResourceAccess($resourceName, $accessList)
    {
    }

    /**
     * Removes an access from a resource
     */
    public function dropResourceAccess($resourceName, $accessList)
    {
    }

    /**
     * Allow access to a role on a resource
     */
    public function allow($roleName, $resourceName, $access, $func = null)
    {
        if ($roleName == '*') $this->_publicAccessKeys[] = strtolower($resourceName . '.' . $access);
    }

    /**
     * Deny access to a role on a resource
     */
    public function deny($roleName, $resourceName, $access, $func = null)
    {;
    }

    /**
     * 检查当前用户是否有权限
     * @param string $roleName 角色id，多个用逗号分隔
     * @param string $resourceName 应用/[模块/]控制器
     * @param string $access 动作名
     * @return bool
     */
    public function isAllowed($roleName, $resourceName, $access, array $parameters = null)
    {
        $accessKey = strtolower($resourceName . "." . $access);

        if (in_array($accessKey, $this->_publicAccessKeys)
            || in_array(strtolower($resourceName . ".*"), $this->_publicAccessKeys)) return true;

        if ($roleName) {
            $roleIds = is_array($roleName) ? $roleName : explode(',', $roleName);
            $accessList = $this->_getActiveAccess($roleIds, 0);
        } else {
            $ticket = $this->getDI()->get('auth')->getTicket();
            if (!$ticket) return false;
            if ($this->_isRoot()) return true;

            $accessList = $this->getActiveAccess();
        }

        return in_array($accessKey, $accessList);
    }

    /**
     * Returns the role which the list is checking if it's allowed to certain resource/access
     * @return string
     */
    public function getActiveRole()
    {;
    }

    /**
     * Returns the resource which the list is checking if some role can access it
     * @return array
     */
    public function getActiveResource()
    {
        //获取所有可用菜单
        $rs = Menu::find(['isshow=1']);
        $menus=[];
        if (!$this->_isRoot()) {
            $accessList = $this->getActiveAccess();
            foreach (array_reverse($menus) as $k => $v) {
                if (!isset($accessList[$v['privilege_id']])) {
                    unset($menus[$k]);
                } 
            }
        }
        foreach ($rs as $r) { 
            $v=$r->toArray();
            if($v['url']!='' && strpos($v['url'],":")===false){
                $i=strpos($v['url'],'?');
                if($i===false){
                    $v['link'] = Utils::url($v['url']);
                }else{
                    $v['link'] = Utils::url(substr($v['url'],0,$i)).'&'.substr($v['url'],$i+1);
                }
            }else{
                $v['link'] =$v['url'];
            }
            $menus[]=$v;
        }
        return $menus;
    }

    /**
     * 返回菜单树
     * 加缓存
     * @return array
     */
    public function getMenuTree($show_all = true)
    {
        if($show_all){
            $rs = Menu::find(['order'=>' listorder asc ']);
        }else{
            if (!$this->_isRoot()) {
                $ticket = $this->_getTicket();
                $conditions = "menu_id > 0 AND (object_type='User' AND object_value=".intval($ticket['uid']).")";
                if (!empty($ticket['roles'])) {
                    $role_id = [];
                    foreach ($ticket['roles'] AS $role) {
                        $role_id[] = $role['id'];
                    }
                    if (!empty($role_id)) {
                        $role_ids = implode(',', $role_id);
                        $conditions .= " OR (object_type = 'Role' AND object_value in (".$role_ids."))";
                    }
                }
                $rs = \Xin\App\Admin\Model\Access::find($conditions)->toArray();
                $menu_id_arr = [];
                if($rs){
                    foreach ($rs as $v) {
                        $menu_id_arr[] = $v['menu_id'];
                    }
                    $menu_id_arr = array_unique($menu_id_arr);
                }
                $where = 'isshow=1';
                if($menu_id_arr){
                    $where .= " AND id IN (".implode(',', $menu_id_arr).")";
                }
                $rs = Menu::find([$where,'order'=>' listorder asc ']);
            }else{
                $rs = Menu::find(['isshow=1','order'=>' listorder asc ']);
            }
        }
        $menus=[];
        foreach ($rs as $r) { 
            $v=$r->toArray();
            if($v){
                if($v['url']!='' && strpos($v['url'],":")===false){
                    $i=strpos($v['url'],'?');
                    if($i===false){
                        $v['link'] = Utils::url($v['url']);
                    }else{
                        $v['link'] = Utils::url(substr($v['url'],0,$i)).'&'.substr($v['url'],$i+1);
                    }
                }else{
                    $v['link'] =$v['url'];
                }
            }
            $menus[]=$v;
        }
        $node_tree = AdminUtils::nodeToTree($menus);
        return $node_tree;
    }

    /**
     * Returns the access which the list is checking if some role can access it
     * @return array
     */
    public function getActiveAccess()
    {
        if (!isset($this->_accessList)) {
            if (!$ticket = $this->_getTicket()) return array();
            $roleids = array();
            foreach ($ticket['roles'] as $role) {
                $roleids[] = $role['id'];
            }
            $this->_accessList = $this->_getActiveAccess($roleids, $ticket['uid']);
        }
        return $this->_accessList;
    }

    protected function _getActiveAccess($roleids, $uid)
    {
        $accessList = [];
        //读取角色权限,仅读取有权限的部分
        if ($roleids) {
            $rs = Access::find(["isallow=1 and object_type='role' AND object_value in ({object_value:array})", 'bind'=>['object_value'=>$roleids]]);
            foreach ($rs as $r) {
                $accessList[$r->id] = $r->accesskey;
            }
        }
        //读取个人权限，并覆盖角色权限
        if ($uid) {
            $rs = Access::find(["object_type=?0 AND object_value=?1",'bind'=>[Access::COLUMN_OBJECTTYPE_USER,$uid]]);            
            foreach ($rs as $r) {
                if ($r->isallow) {
                    $accessList[$r->id] = $r->accesskey;
                } else {
                    unset($accessList[$r->id]);
                }
            }
        }
        return $accessList;
    }

    /**
     * Return an array with every role registered in the list
     * @return RoleInterface[]
     */
    public function getRoles()
    {
    }

    /**
     * Return an array with every resource registered in the list
     * @return  ResourceInterface[] Description
     */
    public function getResources()
    {
    }

    /**
     * 判断当前用户是否用root用户
     * @return bool
     */
    protected function _isRoot()
    {
        $ticket = $this->_getTicket();
        return $ticket['uid'] == $this->_rootUserId;
    }

    protected function _getTicket()
    {
        return $this->getDI()->get('auth')->getTicket();
    }

    public function setNoArgumentsDefaultAction($defaultAccess)
    {
    }

    public function getNoArgumentsDefaultAction()
    {

    }
}
