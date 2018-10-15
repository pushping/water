<?php
namespace Xin\App\Admin\Controller;

use Xin\App\Admin\Model\Account;
use Xin\App\Admin\Model\AccountToRole;
use Xin\App\Admin\Model\Role;
use Xin\Lib\SqlHelper;
use Xin\Lib\Utils;
use Xin\Model\ContainerCluster;
use Xin\Model\ContainerUser;
use Xin\Model\ServiceStorage;
use Xin\Module\User\Model\User;
use Xin\Lib\MessageResponse;
use Xin\App\Admin\Lib\Utils as AdminUtils;

/**
 * 管理员账号管理
 * Class AccountController
 * @package Xin\App\Admin\Controller
 */
class AccountController extends basecontroller
{
    public function loginAction()
    {
    
        $auth = $this->getDI()->get('auth');
        $_config =  $this->di->get('config');
        $forward = $this->di->get('config')->defaultRouter;
        $tag = (int)$this->request->get('tag','int',1);
        $this->view->setVars(["webtitle"=> $_config->webtitle]);
        
        if ($this->request->isPost()) {
            $is_ajax = $this->getDI()->get('request')->isAjax();
            if (!$is_ajax && !$this->security->checkToken()) {
                return new MessageResponse("重复提交表单,请返回重试");
            }
            $username = $this->request->getPost('username');
            $password = $this->request->getPost('password');
            $isremember = $this->request->getPost('remember', 'int', 0);
            try {
                $auth->signInWithKey($username, $password);
                if($isremember) $auth->saveToken();
                if($is_ajax) return new MessageResponse('登录成功', 'succ');
                //TODO 这里判断url前缀是否属于本站
                $_forward = $this->request->getPost('forward');
                //return $this->response->redirect($_forward?$_forward:$forward);
                $forward = 'admin/index/index_v5';
                return $this->response->redirect($forward);
            } catch (\Exception $e) {
                return new MessageResponse($e, 'error');
            }
        }else{
            //检查cookie中是否存在免登陆token
            $auth->signInWithToken();
            if($auth->isAuthorized()){
                return $this->response->redirect('admin/index/index_v5');
            }
        }
    }

    public function getcsrftokenAction(){
        $key = $this->security->getTokenKey();
        $value = $this->security->getToken();
        exit(json_encode([$key=>$value]));
    }

    public function logoutAction()
    {
        $tag = intval($this->request->getQuery("tag"));
        $auth = $this->getDI()->get('auth');
        $auth->removeTicket();
        $forward = $this->di->get('config')->defaultRouter;
        $forward = 'admin/account/login';
        if($tag) $forward .='&tag='.$tag;
        return $this->response->redirect($forward);
    }

    public function listAction()
    {
        $keyword = $this->request->get("keyword");
        $roleid = (int)$this->request->getQuery("roleid","int","0");
        $this->view->setVar('keyword', $keyword);
        $this->view->setVar('roleid', $roleid);
        
        $build= new \Phalcon\Mvc\Model\Query\Builder();
        $build=$build->from(['a' => 'admin:Account'])
            ->innerJoin('user:User','a.uid=u.id','u')
            ->leftJoin('admin:AccountToRole','ar.user_id=a.uid','ar')
            ->columns('count(distinct(u.id)) as count');
        $build=$build->where('a.uid = u.id');
        if($keyword){
            $build=$build->andWhere('u.username like \'%'.SqlHelper::escapeLike($keyword).'%\'');
        }             
        if($roleid){
            $build=$build->andWhere('ar.role_id=:roleid:',['roleid'=>$roleid]);
        }
        $count=$build->getQuery()->execute()->getFirst()['count'];
        $pagination = Utils::loadUserControl('\Xin\Lib\Ctrl\Pagination');
        $pagination->recordCount($count);
        $this->view->setVar('pagination', $pagination);
        if($this->request->get("page","int",1) > $pagination->pageCount()){  $pagination->pageIndex($pagination->pageCount()) ; }
        list($start,$limit) = Utils::offset($pagination->pageIndex(),$pagination->pageSize());
        if (!$pagination->recordCount() || $start>=$pagination->recordCount()) {
            return;
        }
        $this->view->setVar('rolelist',Role::findFillWithKey('id'));
        $rs=$build->columns('u.id,u.username,u.mobile,u.email,u.status as user_status,a.uid,a.create_time,a.update_time,a.status,a.lastloginip,a.lastlogintime,group_concat(ar.role_id) as roleids')
            ->orderBy('u.id desc')
            ->groupBy('a.uid')
            ->limit($limit,$start)
            ->getQuery()
            ->execute();
        $this->view->setVar('objectlist', $rs->toArray());
    }

    public function createAction()
    {
        if ($this->request->isPost()) {
            $data = $_POST;
            if(!$data['roleid'] || !is_array($data['roleid'])){
                return new MessageResponse('请选择角色');
            }
            $roleidArr=$data['roleid'];

            //判断用户是否存在
            $user = User::findFirstByUsername($data['username']);
            if ($user) {
                return new MessageResponse("对不起，用户已存在！");
            }
            if(Role::count(['id in ({id:array})','bind'=>['id'=>$roleidArr]])!=count($roleidArr)){
                return new MessageResponse('选择了无效的角色');
            }

            //判断邮箱
            if(empty($data['email'])){
                return new MessageResponse("邮箱不能为空");
            }
            $user = User::findFirstByEmail($data['email']);
            if ($user) {
                return new MessageResponse("对不起，邮箱已存在！");
            }

            $user = new User();
            $salt = $this->security->getSaltBytes(1);
            $user->nickname=$user->username=$data['username'];
            $user->salt=$salt;
            $user->reg_ip=$this->request->getServer('REMOTE_ADDR');
            $user->status=$data['status'];
            $user->mobile=$data['mobile'];
            $user->email=$data['email'];
            $user->password='';//md5(md5($data['password'] ). $salt);
            $user->avatar=$user->score=$user->money=0;

            $account=new Account();
            $account->password=$this->security->hash($data['password']);
            $account->settings=$data['settings'];
            $account->status=$data['status'];

            $this->db->begin();
            // 执行一些操作
            $flag=(function() use ($user,$account,$roleidArr){    
                try{
                    if(!$user->save()){
                        $this->di->get('logger')->error(implode(";",$user->getMessages()));
                        return;
                    }
                    
                    $account->uid=$user->id;
                    if(!$account->save()){
                        $this->di->get('logger')->error(implode(";",$account->getMessages()));
                        return;
                    }                    
                    
                    foreach($roleidArr as $roleid){
                        $rel=new AccountToRole();
                        $rel->role_id=$roleid;
                        $rel->user_id=$user->id;
                        if(!$rel->save()){
                            $this->di->get('logger')->error(implode(";",$rel->getMessages()));
                            return;
                        }
                    }
                    
                }catch(\Exception $e){
                    $this->di->get('logger')->error($e->getMessage());
                    return false;
                }
                return true;
            })();
            if ($flag && $this->db->commit()) {
                $this->view->setVar('isSaved', 1);
            } else {
                $this->db->rollback();
                return new MessageResponse("创建失败！");
            }
        }else{
            $roleid = (int)$this->request->getQuery("roleid","int","0");
            $this->view->setVar('roleid', $roleid);
            $roles = Role::find(["status!=?0", 'bind' => [Role::COLUMN_STATUS_DELETE]]);
            $this->view->setVar('roles', $roles->toArray());
        }
    }

    public function editAction()
    {
        $id = $this->request->getQuery('id', 'int', 0);
        if ($id < 1 || (!$user = User::findFirstById($id)) || (!$account = Account::findFirstByUid($id))) {
            return new MessageResponse('未找到有效的记录');
        }

        if ($this->request->isPost()) {
            $data = $_POST; 
            $accountdata=[
                'status'=>$data['status']
            ];
            $userdata=[
                'mobile'=>$data['mobile'],
                'email'=>$data['email']
            ];

            if(!$data['roleid'] || !is_array($data['roleid'])){
                return new MessageResponse('请选择角色');
            }
            $roleidArr=$data['roleid'];
            if(Role::count(['id in ({id:array})','bind'=>['id'=>$roleidArr]])!=count($roleidArr)){
                return new MessageResponse('选择了无效的角色');
            }

            if (!empty($data['password']) && $data['password']!=$data['oldpassword']) {
                 //验证旧的密码
                if (!empty($data['oldpassword'])) {
                    if (!$this->di->get('security')->checkHash($data['oldpassword'], $account->password)) {
                        return new MessageResponse('输入了错误的旧密码！');
                    }
                } else {
                    return new MessageResponse('请输入旧的密码！');
                }
                $accountdata['password']=$this->security->hash($data['password']);
            }
            $this->db->begin();
            // 执行一些操作
            $flag=(function() use ($user,$account,$accountdata,$userdata,$roleidArr,$areaidArr){
                try{
                    if(!$user->save($userdata)){
                        $this->di->get('logger')->error(implode(";",$user->getMessages()));
                        return;
                    }
                    
                    if(!$account->save($accountdata)){
                        $this->di->get('logger')->error(implode(";",$account->getMessages()));
                        return;
                    }


                    $this->db->delete((new AccountToRole())->getSource(),'user_id = '.$user->id);
                    $res = $this->db->affectedRows();
                    $this->di->get('logger')->error('删除角色关系个数：'.$res);
                    foreach($roleidArr as $roleid){
                        $rel=new AccountToRole();
                        $rel->role_id=$roleid;
                        $rel->user_id=$user->id;
                        if(!$rel->save()){
                            $this->di->get('logger')->error(implode(";",$rel->getMessages()));
                            return;
                        }
                    }


                }catch(\Exception $e){
                    $this->di->get('logger')->error($e->getMessage());
                    return false;
                }
                return true;
            })();

            $this->di->get('logger')->error("执行结果:".$flag);


            if ($flag && $this->db->commit()) {
                $this->view->setVar('isSaved', 1);
            } else {
                $this->db->rollback();
                return new MessageResponse("保存失败！");
            }
            
        }else{
            $user->area_ids = explode(",",$user->area_ids);
            $this->view->setVar('roles', Role::find()->toArray());
            $accountdata=$account->toArray();
            $accountdata['roles']=$account->getRole()->toArray();
            $this->view->setVar('user', $user->toArray());
            $this->view->setVar('account', $accountdata);
        }
    }

    public function deleteAction()
    {
        $id = $this->request->getPost('id');
        $idList= is_array($id)? $id :[$id];
        if(!Utils::isNumericArray($idList)){            
            return new MessageResponse('无效的参数');
        }
        if(in_array(1,$idList)){
            return new MessageResponse('内置管理员不允许删除');
        }
        $batchflag=true;
        foreach($idList as $id){
            if ($id < 1 || !($user = User::findFirstById($id)) || !($account = Account::findFirstByUid($id))) {
                $this->di->get('logger')->warning('未找到有效的记录User.id='.$user.' ,account.id='.$id);
                $batchflag=false;
                continue;
            }
            
            $this->db->begin();
            // 执行一些操作
            $flag = (function () use ($user, $account) {
                try {
                    if (!$user->delete()) {
                        $this->di->get('logger')->error(implode(";", $user->getMessages()));
                        return false;
                    }
                    foreach($account->getAccountToRole() as $rel){
                        if (!$rel->delete()) {
                            $this->di->get('logger')->error(implode(";", $rel->getMessages()));
                            return false;
                        }
                    }
                    if (!$account->delete()) {
                        $this->di->get('logger')->error(implode(";", $account->getMessages()));
                        return false;
                    }
                } catch (\Exception $e) {
                    $this->di->get('logger')->error($e->getMessage());
                    return false;
                }
                return true;
            })();

            if (!$flag || !$this->db->commit()) {
                $this->db->rollback();
                $batchflag=false;
            }
        }

        if ($batchflag) {
            return new MessageResponse("选定信息已删除",'succ');
        } else {
            return new MessageResponse("部分信息删除失败");
        }
    }
	
	public function detailAction()
    {
        $id = $this->request->getQuery('id', 'int', 0);
        if ($id < 1 || (!$user = User::findFirstById($id)) || (!$account = Account::findFirstByUid($id))) {
			$this->view->setVar('error', '未找到有效的记录');
        }else{
			$this->view->setVar('roles', Role::find()->toArray());
			$accountdata=$account->toArray();
			$accountdata['roles']=$account->getRole()->toArray();
			$this->view->setVar('user', $user->toArray());
			$this->view->setVar('account', $accountdata);
		}
    }

    public function ssoAction(){
        //https://iam.ctwing.cn/auth/#/auth?client_id=FVHwF448alc&redirect_uri=http://www.iot-saas.com/index.php?_url=admin/account/sso&scope=user&state=Aep2018test
//https://iam.ctwing.cn/auth/#/auth?client_id=FVHwF448alc&redirect_uri=http://www.iot-saas.com/index.php?_url=admin/account/sso&scope=user&state=Aep2018test

        $aepAppKey=$this->di->getConfig()->aepAppKey;
        $aepAppSecret=$this->di->getConfig()->aepAppSecret;
        if(!$aepAppKey&&!$aepAppSecret){
            return new MessageResponse("获取key或secret失败！");
        }
        $code = $this->request->get('code');
        $tokenUrl="https://iam.ctwing.cn/oauth2/access_token?client_id=$aepAppKey&client_secret=$aepAppSecret&grant_type=code&code=$code";
        $tokenJson=json_decode(file_get_contents($tokenUrl),true);
        if($tokenJson){
            $accessToken=$tokenJson['accessToken'];
            $userUrl="https://iam.ctwing.cn/services/oauth2/UserInfo?access_token=$accessToken";
            $userInfo=json_decode(file_get_contents($userUrl),true);
            if($userInfo['code']=='core.ok'){
                $user = User::findFirstByUsername($userInfo['data']['loginId']);
                //未查找到账号进行注册--begin
                if(!$user){
                    $roleBuild = new \Phalcon\Mvc\Model\Query\Builder();
                    $roleBuild = $roleBuild->from(['r' => 'admin:role'])
                        ->columns('*')
                        ->where('r.rolename like :keyword:', ['keyword' => '超级管理员']);
                    $roleId = $roleBuild->getQuery()->execute()->getFirst()->toArray()['id'];
                    $user = new User();
                    $salt = $this->security->getSaltBytes(1);
                    $user->nickname=$user->username=$userInfo['data']['loginId'];
                    $user->salt=$salt;
                    $user->reg_ip=$this->request->getServer('REMOTE_ADDR');
                    $user->status='enable';
                    $user->mobile=' ';
                    $user->email=$userInfo['data']['loginId'].'@auto.com';
                    $user->password=' ';//md5(md5($data['password'] ). $salt);
                    $user->avatar=$user->score=$user->money=0;
                    $user->area_ids = ' ';

                    $account=new Account();
                    $account->password=$this->security->hash('123456');
                    $account->settings=' ';
                    $account->status='enable';

                    $this->db->begin();
                    // 执行一些操作
                    $flag=(function() use ($user,$account,$roleId){
                        try{
                            if(!$user->save()){
                                $this->di->get('logger')->error(implode(";",$user->getMessages()));
                                return;
                            }

                            $account->uid=$user->id;
                            if(!$account->save()){
                                $this->di->get('logger')->error(implode(";",$account->getMessages()));
                                return;
                            }

                                $rel=new AccountToRole();
                                $rel->role_id=$roleId;
                                $rel->user_id=$user->id;
                                if(!$rel->save()){
                                    $this->di->get('logger')->error(implode(";",$rel->getMessages()));
                                    return;
                                }

                        }catch(\Exception $e){
                            $this->di->get('logger')->error($e->getMessage());
                            return false;
                        }
                        return true;
                    })();
                    if ($flag && $this->db->commit()) {
                        $this->view->setVar('isSaved', 1);
                    } else {
                        $this->db->rollback();
                        return new MessageResponse("创建失败！",'error',['登录'=>'index.php?_url=admin/account/login','goback']);
                    }
                }
                //未查找到账号进行注册--end
                $auth = $this->getDI()->get('auth');
                $username = $user->username;
                $password = $user->password;
                try {
                    $auth->signInWithKey($username, $password,false);
                    $is_ajax = $this->getDI()->get('request')->isAjax();
                    if($is_ajax) return new MessageResponse('登录成功', 'succ');
                    //TODO 这里判断url前缀是否属于本站
                    $_forward = $this->request->getPost('forward');
                    //return $this->response->redirect($_forward?$_forward:$forward);
                    $forward = 'admin/index/index_v5';
                    return $this->response->redirect($forward);
                } catch (\Exception $e) {
                    return new MessageResponse($e, 'error');
                }
            }else{
                return new MessageResponse("对不起，用户信息授权失败!",'error',['登录'=>'index.php?_url=admin/account/login','goback']);
            }
        }else{
            return new MessageResponse("对不起，code过期导致授权失败!");
        }


    }
}