<?php

namespace Xin\App\Admin\Model;

use Xin\Lib\ModelBase;

class Access extends ModelBase
{
    const COLUMN_OBJECTTYPE_ROLE="role";
    const COLUMN_OBJECTTYPE_USER="user";
    
    const COLUMN_ACCESSTYPE_PAGE="page";
    const COLUMN_ACCESSTYPE_DATA="data";
    const COLUMN_ACCESSTYPE_ACTION="action";

	/**
	 * 修改角色权限
	 */
	public function editRoleNodes($role_id,$node_id_array){
	    $role_node_array=array();
	    foreach($node_id_array as $i=>$node_id){
	        $role_node_array[]=["object_type"=>"Role","object_value"=>$role_id,"menu_id"=>$node_id];
	    }
	    $db = $this->getDI()->get('db');
	    $db->begin();
	    // 执行一些操作
	    $flag=(function() use ($role_id,$role_node_array,$db){
	        try{
	            $old_menu = $this->find(["object_value = :object_value: AND menu_id > 0 AND object_type = 'Role'",'bind'=>['object_value'=>$role_id]]);
	            if($old_menu->toArray()){
	            	if(!$old_menu->delete()){
	            	    $this->di->get('logger')->error(implode(";",$old_menu->getMessages()));
	            	    return false;
	            	}
	            }     
	            
	            if(!$this->batch_insert($role_node_array,$db)){
	            	return false;
	            }
	        }catch(\Exception $e){
	            $this->di->get('logger')->error($e->getMessage());
	            return false;
	        }
	        return true;
	    })();
	    if ($flag && $db->commit()) {
	        return true;
	    } else {
	        $db->rollback();
	        return false;
	    }
	}

	/**
     * 批量添加
     * @param array $data
     * @return boolean
     * @throws \Exception
     */
    public function batch_insert($data,$db){
        if (count($data) == 0) {
            throw new \Exception('参数错误');
        }
        $keys = array_keys(reset($data));
        $keys = array_map(function ($key) {
            return "`{$key}`";
        }, $keys);
        $keys = implode(',', $keys);
        $sql = "INSERT INTO " . $this->getSource() . " ({$keys}) VALUES ";
        foreach ($data as $v) {
            $v = array_map(function ($value) {
                return "'{$value}'";
            }, $v);
            $values = implode(',', array_values($v));
            $sql .= " ({$values}), ";
        }
        $sql = rtrim(trim($sql), ',');
        //DI中注册的数据库服务名称为"db"
        $result = $db->execute($sql);
        if (!$result) {
            throw new \Exception('批量入库记录失败');
        }
        return $result;
    }
}
