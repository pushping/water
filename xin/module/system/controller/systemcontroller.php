<?php

namespace Xin\Module\System\Controller;

use Xin\App\Admin\Controller\basecontroller;
use Xin\App\Admin\Model\System;
use Xin\Lib\Utils;
use Xin\Module\Gallery\Model\Gallery;
use Xin\Module\User\Model\User;

class SystemController extends basecontroller
{

    //系统设置
    public function setAction(){
        $list  = System::find()->toArray();
        $this->view->setVar('list',$list);
    }

    //更新
    public function updateAction(){
        $params = $this->request->getpost();
        $check = 0;
        foreach ($params as $key=>$item){
            $sysItem = System::findFirstByName($key);
            if($sysItem){
                $sysItem->value = $item ;
                if(!$sysItem->save()){
                    $check ++;
                }
            }
        }
        if($check){
            return json_encode(['code'=>-1,'msg'=>'更新失败']);
        }else{
            return json_encode(['code'=>200,'msg'=>'更新成功']);
        }
    }


    //新增
    public function indexAction(){
        $id = (int)$this->request->get('id','int',0);
        $region = Region::findFirstById($id);
        if(!$region){
            $region = new Region();
            $adminList = Region::find([
                'columns'=>'admin_id'
            ])->toArray();
            $adminList = User::find(["username is not null  and id not in ({ids:array}) ",
                    'bind'=>['ids'=>array_column($adminList,'admin_id')]
            ])->toArray();
            $adminList = array_merge([['id'=>0,'username'=>'请选择']],$adminList);
            $this->view->setVars(['region'=>$region,'logo'=>[],'indexbg'=>[],'loginbg'=>[],'adminList'=>$adminList]);
        }else{
            $area = Area::findFirstById($region->root_area);
            if($area) $region->root_area = $area->name;
            $org = Organization::findFirstById($region->root_org);
            if($org) $region->root_org = $org->name;
            $adminList = User::find(["id=:aid:",'bind'=>['aid'=>$region->admin_id]])->toArray();
            $admin = User::findFirstById($region->admin_id);
            if($admin) $region->admin_id = $admin->username;

            $logo = Gallery::findFirstById($region->logo);
            if($logo){
                $logo = $logo->toArray();
                $logo['path'] = $this->prePath.$logo['path'];
            }
            $indexbg = Gallery::findFirstById($region->index_bg);
            if($indexbg){
                $indexbg =$indexbg->toArray();
                $indexbg['path'] = $this->prePath.$indexbg['path'];
            }
            $loginbg = Gallery::findFirstById($region->login_bg);
            if($loginbg){
                $loginbg = $loginbg->toArray();
                $loginbg['path'] = $this->prePath.$loginbg['path'];
            }

            $this->view->setVars(['region'=>$region,'logo'=>[$logo],'indexbg'=>[$indexbg],'loginbg'=>[$loginbg],'adminList'=>$adminList]);
        }
    }

    //多租户管理
    public function listAction(){
        $count = Region::count([
            "status = :st:",
            'bind'=>['st'=>1]]
        );

        $pagination = Utils::loadUserControl('\Xin\Lib\Ctrl\Pagination');
        $pagination->recordCount($count);
        $this->view->setVar('pagination', $pagination);

        if($this->request->get("page","int",1) > $pagination->pageCount()){  $pagination->pageIndex($pagination->pageCount()) ; }
        list($start,$limit) = Utils::offset($pagination->pageIndex(),$pagination->pageSize());
        if (!$pagination->recordCount() || $start >= $pagination->recordCount()) {
            return;
        }

        $build = new \Phalcon\Mvc\Model\Query\Builder();
        $rs = $build
            ->from(["r"=>"Xin\Module\System\Model\Region"])
            ->columns(['r.id','r.name','admin'=>'u.username'])
            ->leftjoin("user:user","u.id=r.admin_id",'u')
            ->where("r.status = :st:",['st'=>1])
            ->orderby('r.id desc')
            ->limit($limit, $start)
            ->getQuery()
            ->execute()
            ->toArray();

        $loginUrlPre = $this->di->get('config')->website."index.php?_url=admin/account/login&tag=";
        $this->view->setVars(["loginUrlPre"=>$loginUrlPre,"objectlist"=>$rs]);
    }

    //提交更新、新增一个区域
    public function update2Action(){
        $id = (int)$this->request->getPost('id','int',0);
        $region = Region::findFirstById($id);
        $name =  $this->request->getPost('name');
        $logoid = $this->request->getPost('logoid');
        $indexbgid = $this->request->getPost('indexbgid');
        $loginbgid = $this->request->getPost('loginbgid');
        if($region){
            try{
                $name =  $this->request->getPost('name');
                if(empty($name) ||  empty($indexbgid) || empty($loginbgid)){
                    throw new \Exception("参数异常");
                }
                $region->name = $name;
                $region->logo = $logoid[0] ? $logoid[0] : 0;
                $region->index_bg = $indexbgid[0];
                $region->login_bg = $loginbgid[0];
                if(!$region->save()){
                    throw new \Exception($region->getMessages());
                }
            }catch (\Exception $e){
                $this->di->get('logger')->error($e->getMessage());
                return json_encode(['code'=>-1,'msg'=>'更新失败','desc'=>$e->getMessage()]);
            }
        }else{
            $this->db->begin();
            try{
                $areaName =  $this->request->getPost('area_name');
                $orgName =  $this->request->getPost('org_name');
                $accid = (int)$this->request->getPost('account','int',0);
                if(empty($name) || empty($logoid) || empty($indexbgid) || empty($loginbgid)||empty($areaName) || empty($orgName) || $accid<1){
                    throw new \Exception("参数异常");
                }

                $area = new Area();
                $area->name =$areaName;
                $area->bssw = '116.327012,40.006409';
                $area->bsne = '116.335869,40.010554';
                $area->map_center = '116.331441,40.008481';
                $area->map_zoom = 17;
                $area->marker_point = '116.339008,40.020905';
                $area->img_id = 0;
                $area->parentid = 0;
                $area->deepth = 1;
                $area->area_type =1;
                $area->status =1;
                if(!$area->save()){
                    throw new \Exception($area->getMessages());
                }
                $key = 'G_AreaIds';
                $this->session->remove($key);

                $org = new Organization();
                $org->name = $orgName;
                $org->parentid = 0;
                $org->deepth = 1;
                $org->area_id = $area->id;
                if(!$org->save()){
                    throw new \Exception($org->getMessages());
                }

                $region = new Region();
                $region->root_area = $area->id;
                $region->root_org = $org->id;
                $region->name = $name;
                $region->admin_id = $accid;
                $region->logo = $logoid[0];
                $region->index_bg = $indexbgid[0];
                $region->login_bg = $loginbgid[0];
                $region->status = 1;
                if(!$region->save()){
                    throw new \Exception($region->getMessages());
                }

                //更新对应admin的归属区域
                $user = User::findFirstById($accid);
                if($user){
                    $user->area_ids = $area->id ;
                    if(!$user->save()){
                        throw new \Exception($user->getMessages());
                    }
                }

                $this->db->commit();
            }catch (\Exception $e){
                $this->db->rollback();
                $this->di->get('logger')->error($e->getMessage());
                return json_encode(['code'=>-1,'msg'=>'更新失败','desc'=>$e->getMessage()]);
            }
        }
        return json_encode(['code'=>200,'msg'=>'更新成功']);
    }

    public function deleteAction(){
        $id = (int)$this->request->getPost("id",'int',0);
        $region =  Region::findFirst(["id=:id:",'bind'=>['id'=>$id]]);
        if($region ){
            $region->status = 0;
            if($region->save()){
                return json_encode(['code'=>200,'msg'=>"删除成功"]);
            }
        }
        return json_encode(['code'=>-1,'msg'=>"删除失败"]);
    }
}
