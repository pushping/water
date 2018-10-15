<?php

namespace Xin\App\Admin\Service;

use Phalcon\Db\Column;
use Phalcon\Mvc\User\Module;
use Xin\App\Admin\Model\Account;
use Xin\Module\User\Model\UserToken;
use Xin\Module\User\Model\User;

class Auth extends Module
{
    const SESSION_KEY='auth-identity';
    protected $_ticket;
    protected $_autologin;

    public function isAuthorized()
    {
        $ticket=$this->getTicket();
        return $ticket && $ticket['uid'];
    }

    /**
     * 返回当前用户信息
     *
     * @return array (uid,nickname,username,settings,roles)
     */
    public function getTicket()
    {
        if($this->_ticket == null){
            $this->_ticket= $this->session->get(self::SESSION_KEY);
            !$this->_ticket && $this->_ticket=array();
        }
        return $this->_ticket;
    }

    protected function saveTicket($user) {

        $this->_ticket=$user;
        $this->session->set(self::SESSION_KEY,$this->_ticket );
    }

    public function removeTicket() {
        if ($this->cookies->has('RMT')) {
            $this->cookies->get('RMT')->delete();
        }
        $this->session->remove(self::SESSION_KEY);
        $this->session->destroy();
    }

    public function signInWithKey($username,$pwd,$ischeck=true){
        $user = User::findFirstByUsername($username);

        if (!$user) {
            throw new \Exception('错误的用户名');
        }
        
        $adminUser = Account::findFirstByUid($user->id);
        if (!$adminUser || $adminUser->status!=Account::COLUMN_STATUS_ENABLE) {
            throw new \Exception('该管理账户不存在或被禁用');
        }

        if(!$this->security->checkHash($pwd, $adminUser->password)&&$ischeck){
            throw new \Exception('错误的密码');
        }

        $adminUser->lastloginip = $this->request->getClientAddress();
        $adminUser->lastlogintime = time();
        if (!$adminUser->save()) {
            $this->logger->error(implode(';',$adminUser->getMessages()));
        }

        $roles = array();
        foreach ($adminUser->getRole()->toArray() as $item) {
            $roles[$item['id']] = $item;
        }

        $this->saveTicket([
            'uid' => $user->id,
            'nickname' => $user->nickname,
            'username' => $user->username,
            'settings' => $adminUser->settings,
            'area_ids' => $user->area_ids,
            'roles'=>$roles
        ]);

        return true;
    }


    public function signInWithToken(){
        $cookieVal = $this->cookies->get('RMT')->getValue();
        if (!$cookieVal){
            return false;
        }
        list($userId,$cookieToken)=explode('|',$cookieVal);
        if( !is_numeric($userId) || !$cookieToken) return false;

        $adminUser = Account::findFirstByUid($userId);
        $user = User::findFirstById($userId);
        if ($user && $adminUser && $user->status && $adminUser->status) {
            $userAgent = $this->request->getUserAgent();
            $token = md5($user->username . $userAgent.$this->config->security->salt);

            if ($cookieToken == $token) {
                $r = UserToken::findFirst([
                    'uid = ?0 AND token = ?1',
                    'bind' =>[$user->id,$token]
                ]);
                if ($r) {
                    if (time() < $r->expire_time) {
                        $adminUser->lastloginip = $this->request->getClientAddress();
                        $adminUser->lastlogintime = time();
                        if (!$adminUser->update()) {
                            $this->logger->error(implode(';',$adminUser->getMessages()));
                        }

                        $roles = array();
                        foreach ($adminUser->getRole()->toArray() as $item) {
                            $roles[$item['id']] = $item;
                        }

                        $this->saveTicket([
                            'uid' => $user->id,
                            'nickname' => $user->nickname,
                            'username' => $user->username,
                            'settings' => $adminUser->settings,
                            'area_ids' => $user->area_ids,
                            'roles'=>$roles
                        ]);

                        return true;
                    } else {
                        $r->delete();
                    }
                }
            }
        }

        $this->cookies->get('RMT')->delete();
        return false;
    }

    public function saveToken(){
        $ticket=$this->getTicket();
        if(!$ticket) return false;
        $userAgent = $this->request->getUserAgent();
        $token = md5($ticket['username'] . $userAgent.$this->config->security->salt);
        $expire = time() + 3600*24*30;

        $res = $this->modelsManager->createQuery('delete from Xin\Module\User\Model\UserToken where token=:token: and uid=:uid:')
            ->execute([
                'token'=>$token,
                'uid'=>$ticket['uid']
                ]);
        $userToken = new UserToken();
        $userToken->uid = $ticket['uid'];
        $userToken->expire_time = $expire;
        $userToken->token = $token;
        $userToken->useragent = $userAgent;
        if ($userToken->create() != false) {
            $this->cookies->set('RMT', $ticket['uid']."|".$token, $expire);
            $this->cookies->send();
        }
        return true;
    }

    /**
     * 返回当前用户所属的用户组
     * @return array
     */
    public function getRoles() {
        $ident = $this->getTicket();
        return $ident && $ident['roles'] ? $ident['roles'] : array();
    }


    /**
     * @todo 返回当前用户拥有权限
     */
    public function getAccess($conditions, $bind) {
        $phql = "SELECT p.accesskey FROM admin:Privilege p
                 LEFT JOIN admin:Access a  ON p.id = a.privilege_id 
                 WHERE " . $conditions;
        $rs = $this->getDI()->get('modelsManager')->createQuery($phql)->execute($bind)->toArray();
        $access = [];
        if (!empty($rs)) {
            foreach ($rs as $item) {
                $access[] = implode('/', explode('.', $item['accesskey']));
            }
        }
        return $access;
    }

    /**
     * @todo 返回当前用户拥有权限
     */
    public function getNewAccess($conditions, $bind) {
        $phql = "SELECT m.url FROM admin:Menu m
                 LEFT JOIN admin:Access a  ON m.id = a.menu_id
                 WHERE m.url != '' AND " . $conditions;
        $rs = $this->getDI()->get('modelsManager')->createQuery($phql)->execute($bind)->toArray();
        $access = [];
        if (!empty($rs)) {
            foreach ($rs as $item) {
                if($item['url']) $access[] = $item['url'];
            }
        }
        return $access;
    }
}