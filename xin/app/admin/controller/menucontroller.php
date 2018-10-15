<?php

namespace Xin\App\Admin\Controller;

use Phalcon\Db;
use Xin\Lib\Utils;
use Xin\App\Admin\Model\Menu,
    Xin\App\Admin\Model\Privilege;
use Phalcon\Mvc\Model\Exception;
use Xin\App\Admin\Service\Acl;
use Xin\App\Admin\Lib\Utils as AdminUtils;

class MenuController extends basecontroller
{
    /**
     * 菜单列表
     */
    public function listAction()
    {
        $menus = [];
        $menus = Acl::getMenuTree();
        $menuHtml = '';
        foreach($menus as $menu){
            AdminUtils::createMenuHtml($menuHtml,$menu);
        }
        $this->view->setVars(['menuHtml' => $menuHtml]);
    }

    /**
     * 创建菜单
     */
    public function createAction()
    {
        if ($this->request->isPost()) {
            $menu = new Menu();
            $datas = $_POST;
            $datas['parentid']=intval($datas['parentid']);
            if ($datas['parentid']>0) {
                $parent = Menu::findFirstById($datas['parentid'])->toArray();
                if (!$parent) {
                    return new \Xin\Lib\MessageResponse('无效的参数parentid');
                }
            }
            $datas['isshow'] = $datas['isshow'] ? 1 : 0;
            $datas['listorder'] = intval($datas['listorder']);
            $datas['settings'] && $datas['settings'] = json_encode($datas['settings']);            
            $datas['url']=trim($datas['url']);

            try{
                if (!$menu->save($datas)) {
                    throw new \Exception(implode(";",$menu->getMessages()));
                } else {
                    return new \Xin\Lib\MessageResponse('数据已保存', 'succ');
                }
            }catch(\Exception $e){
                $this->di->get('logger')->error($e->getMessage());
                return new \Xin\Lib\MessageResponse("保存数据失败");                
            }
        }
    }

    /**
     * 编辑菜单
     */
    public function editAction()
    {
        if ($this->request->isPost()) {
            $id = $this->request->get('id', 'int');
            $menu = Menu::findFirstById($id);
            if (!$menu) {
                return new \Xin\Lib\MessageResponse('无效的记录');
            }
            $datas = $_POST;
            $menu_data = [];
            $menu_data['title'] = $datas['name'];
            $menu_data['settings']['icon'] = $datas['icon'];
            $menu_data['url'] = $datas['href'];
            $menu_data['isshow'] = $datas['isshow'];
            try{               
                if (!$menu->save($menu_data)) {
                    throw new \Exception(implode(";",$menu->getMessages()));
                }
            }catch(\Exception $e){
                $this->di->get('logger')->error($e->getMessage());
                return new \Xin\Lib\MessageResponse("保存数据失败");                
            }           
            return new \Xin\Lib\MessageResponse('数据已保存', 'succ');
        }
        return new \Xin\Lib\MessageResponse('error');
    }

    /**
     * 删除菜单
     */
    public function deleteAction()
    {
        $id = intval($this->request->getPost('id'));
        if ($id < 1 || !$menu = Menu::findFirstById($id)) {
            return new \Xin\Lib\MessageResponse('错误的参数');
        }
        try {
            if (!$menu->delete()) {
                //删除所有子级 和 在access表中的相关记录
                return new \Xin\Lib\MessageResponse('数据保存失败:' . $menu->getMessages());
            }
            return new \Xin\Lib\MessageResponse('数据已删除', 'succ');
        } catch (\Exception $e) {
            return new \Xin\Lib\MessageResponse('数据保存失败:' . $e->getMessages());
        }
    }

    /**
     * 菜单排序
     */
    public function orderAction()
    {
        $result = array('status' => 'error', 'message' => '错误的参数格式');
        $order = $this->request->getPost('order');
        if(empty($order)||!is_array($order)) exit(json_encode($result));
        try {
            $all_menu = [];
            //先取出所有菜单数据
            $menu_array = Menu::find([
                'columns' => 'id,listorder'
            ])->toArray();
            if($menu_array){
                foreach ($menu_array as $v) {
                    $all_menu[$v['id']] = $v['listorder'];
                }
            }
            $menu = new Menu();
            $conn = $menu->getWriteConnection();
            $conn->begin();
            $flag = true;
            foreach ($order as $listorder => $id) {
                if(array_key_exists($id, $all_menu) && $all_menu[$id] != $listorder){
                    if (!$conn->update($menu->getSource(), array('listorder'), array($listorder), "id='{$id}'")) {
                        $flag = false;
                        break;
                    }
                }
            }
            if ($flag && $conn->commit()) {
                $result['status'] = 'ok';
            } else {
                $conn->rollback();
            }
        } catch (\Phalcon\Mvc\Model\Transaction\Failed $e) {
            $result['message'] = $e->getMessage();
        }
        exit(json_encode($result));
    }

    //全部保存
    public function saveAllAction()
    {
        exit();
        $data=$this->request->getJsonRawBody(true);
        if(!$data || !is_array($data)){
            return new \Xin\Lib\MessageResponse('错误的参数格式');
        }
        $oldMenus=Menu::findFillWithKey('id',null,true);
        $newItems=[];
        try {
            $this->db->begin();
            $flag = true;
            foreach ($data as $item) {
                $newid=false;
                if($item['id']{0}=='T'){
                    $menu=new Menu(); 
                    $newid=$item['id'];
                    unset($item['id']);
                }else{
                    if(!isset($oldMenus[$item['id']])){
                        return new \Xin\Lib\MessageResponse('数据版本发生变化，请刷新重试');
                    }else{
                        $menu=$oldMenus[$item['id']];
                        unset($oldMenus[$item['id']]);
                    }
                }
                if($item['parentid']{0}=='T'){
                    $item['parentid']= $newItems[$item['parentid']]?$newItems[$item['parentid']] :0;
                }
                if(!$menu->save($item)){
                    $this->di->get('logger')->error( var_export($item,1));
                    $this->di->get('logger')->error( implode(';',$menu->getMessages()));
                    $flag=false;
                    break;
                }
                if($newid){
                    $newItems[$newid]=$menu->id;
                }
            }
            if($flag){
                foreach($oldMenus as $menu){                    
                    if(!$menu->delete()){
                        $this->di->get('logger')->error( implode(';',$menu->getMessages()));
                        $flag=false;
                        break;
                    }
                }
            }
            if ($flag && $this->db->commit()) {
                return new \Xin\Lib\MessageResponse('批量操作已保存','succ');
            } else {
                $this->db->rollback();
            }
        } catch (\Exception $e) {
            $this->di->logger->error(implode(";", $e->getMessage()));
        }

        return new \Xin\Lib\MessageResponse('保存结果失败');
    }
}
