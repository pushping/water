<?php

namespace Xin\App\Admin;

use Phalcon\Events\Manager;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Logger;
use Xin\Lib\Utils;
use Xin\App\Admin\Model\Menu;

class App
{
    public function registerAutoloaders($di)
    {
    }

    public function registerServices($di)
    {
        $di->getModelsManager()->registerNamespaceAlias('admin', '\Xin\App\Admin\Model');

        $di->set('acl', function () {
            return new Service\Acl();
        }, true);
        $di->set('auth', function () {
            return new Service\Auth();
        }, true);
        $eventsManager = new Manager();
        $eventsManager->attach('dispatch:beforeDispatch', function ($event, $dispatcher) use ($di) {
            if ($dispatcher->wasForwarded()) {
                return;
            }

            //转向不鉴权
            $c = $dispatcher->getControllerName();
            $a = $dispatcher->getActionName();
            $m = $dispatcher->getModuleName();
            if ($c == 'account' && in_array($a,['login','logout','noallow','sso'])) {
                return;
            }
            if ($c == 'index' && $a == 'push') {
                return;
            }
            if ($c == 'api'){
                return  ;
            }

            $auth = $di->get('auth');
            if (!$auth->isAuthorized() && !$auth->signInWithToken()) {
                if(!$di->get('request')->isAjax()){
                    return header("Location: ".Utils::url('admin/account/login'));
                }
                $resp=new \Xin\Lib\MessageResponse('请先登录系统', 'error', ['登录'=>Utils::url('admin/account/login')]);
                echo $resp->getContent();
                exit;
            }
            //判断用户权限
            $ticket = $auth->getTicket();
            if ($ticket['uid'] != 1) {//超级管理员跳过验证
                //判断下改url是否加入节点
                $url = strtolower($m) . '/' . strtolower($c) . '/' . strtolower($a);
                $is_node = Menu::findFirst(array(
                    "url = :url:",
                    "bind" => array('url' => $url)
                ));
                if($is_node && $is_node->title == '首页'){
                    return  ;
                }
                if ($is_node && $ticket) {
                    $bind = [];
                    $conditions = "(a.object_type='User' AND a.object_value=".intval($ticket['uid']).")";
                    if (!empty($ticket['roles'])) {
                        $role_id = [];
                        foreach ($ticket['roles'] AS $role) {
                            $role_id[] = $role['id'];
                        }
                        if (!empty($role_id)) {
                            $role_ids = implode(',', $role_id);
                            $conditions .= " OR (a.object_type = 'Role' AND a.object_value in (".$role_ids."))";
                        }
                    }
                    $access = $auth->getNewAccess($conditions, $bind);
                    if (empty($access) || !in_array($url, array_map('strtolower',$access))) {
                        $resp= new \Xin\Lib\MessageResponse('您无权限访问该页面', 'error',['goback','home','重新登录'=>Utils::url('admin/account/logout')]);
                        echo $resp->getContent();
                        exit;
                    }
                }
            }
        });
        $di->getShared('dispatcher')->setEventsManager($eventsManager);
        $config = $di->get('config');
        $di->set('invo', function () use ($config) {
            $dbconfig = $config->database->invo;
            try {
                $connection = new \PDO("sqlsrv:Server=".$dbconfig->host.";Database=".$dbconfig->dbname,$dbconfig->username,$dbconfig->password);
                return $connection;
            } catch (\PDOException $e) {
                echo "Mssql链接失败: ".$e->getMessage();
                exit;
            }
        });
    }
}