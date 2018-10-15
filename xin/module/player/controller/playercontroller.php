<?php

namespace Xin\Module\Player\Controller;

use Couchbase\Exception;
use Xin\App\Admin\Controller\basecontroller;
use Xin\App\Admin\Model\Deposit;
use Xin\App\Admin\Model\FlowDetail;
use Xin\App\Admin\Model\Player;
use Xin\Lib\Utils;

class PlayerController extends basecontroller
{
    //玩家列表
    public function listAction()
    {
        $count = Player::count();
        $pagination = Utils::loadUserControl('\Xin\Lib\Ctrl\Pagination');
        $pagination->recordCount($count);
        list($start,$limit) = Utils::offset($pagination->pageIndex(),$pagination->pageSize());

        $keyname = $this->request->get('keyname','string','');
        $min = $this->request->get('min','float');
        $max = $this->request->get('max','float');

        $query = Player::query();
        if(!empty($min)){
            $query->andwhere("point>=".$min)->orderBy('point desc');
        }
        if(!empty($max)){
            $query->andwhere("point<=".$max)->orderBy('point desc');
        }
        if(!empty($keyname)){
            $query->andwhere("(id = ".intval($keyname)." or name like '%".$keyname."%')")->orderBy('id desc');;
        }
        $player = $query
            ->limit($limit, $start)
            ->orderby("id desc")
            ->execute()
            ->toArray();

        $this->view->setVars(['player'=>$player,'pagination'=>$pagination,'keyname'=>$keyname,'min'=>$min,'max'=>$max]);
    }

    //新增一个玩家
    public function addAction(){
        $id = intval($this->request->get('id'));
        $name = "";
        $point = 0;
        if($id){
            $player = Player::findFirstById($id);
            if(!empty($player)){
                $name = $player->name;
                $point = $player->point;
            }
        }
        $this->view->setVars(['id'=>$id,'name'=>$name,'point'=>$point]);
    }

    //玩家历史记录
    public function detailAction(){
        $id = intval($this->request->get('id'));
        if(!$id){
            return "请输入正确ID";
        }
        $player = Player::findFirstById($id);
        if(!$player){
            return "请输入正确ID";
        }

        $count = FlowDetail::count("userid = ".$id);
        $count2 = Deposit::count("userid=".$id);
        $count += $count2 ;
        $pagination = Utils::loadUserControl('\Xin\Lib\Ctrl\Pagination');
        $pagination->recordCount($count);
        list($start,$limit) = Utils::offset($pagination->pageIndex(),$pagination->pageSize());
        $sql = "select flowid,left_point,createtime from dc_flow_detail where userid = ".$id.
            " union select 0 as flowid,point as left_point,createtime  from dc_deposit where userid = ".$id.
            " ORDER BY createtime desc limit ".$start.",".$limit.";";
        $list = $this->di->get('db')->fetchAll($sql);

        foreach ($list as &$item){
            $item['flowid'] = $item['flowid']==0? "管理员操作" : "游戏ID：".$item['flowid'];
            $item['createtime'] = date("Y-m-d H:i:s",$item['createtime']);
            $item['left_point'] = $item['left_point']>0?"+".$item['left_point'] : $item['left_point'];
        }unset($item);
        $this->view->setVars(['list'=>$list,'pagination'=>$pagination,'username'=>$player->name]);
    }

    //AJAX 更新、新增玩家
    public function updateAction(){
        $id = intval($this->request->getPost('id'));
        $name = strval($this->request->getPost('name'));
        $point = floatval($this->request->getPost('point'));

        $this->db->begin();
        try{
            if(empty($name) ){
                throw new \Exception("参数异常");
            }

            $oriPoint = 0;
            if($id){
                $player = Player::findFirstById($id);
                $oriPoint = $player->point;
            }else{
                $player =  new Player();
            }
            $player->name = $name ;
            $player->point = $point;
            if(!$player->save()){
                throw new \Exception("保存失败");
            }
            $newlog = new Deposit();
            $newlog->user = $player->name ;
            $newlog->userid = $player->id;
            $newlog->point = round(floatval($point - $oriPoint),2);
            $newlog->createtime = time();
            if(!$newlog->save()){
                throw new \Exception("操作记录更新失败");
            }

            $this->db->commit();
            return json_encode(['code'=>200,'msg'=>"更新成功"]);
        }catch (\Exception $e){
            $this->db->rollback();
            return json_encode(['code'=>-1,'msg'=>$e->getMessage()]);
        }

    }

}