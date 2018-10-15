<?php
namespace Xin\App\Admin\Controller;


use Xin\App\Admin\Model\Access;
use Xin\App\Admin\Model\ActionLogs;
use Xin\App\Admin\Model\DeviceType;
use Xin\App\Admin\Model\Menu;
use Xin\App\Admin\Model\Role;
use Xin\Lib\SqlHelper;
use Xin\Lib\Utils;
use Phalcon\Events\Manager;
use Xin\Lib\MessageResponse;
use Xin\Module\Area\Model\Area;
use Xin\Module\Device\Model\Device;
use Xin\Module\Gallery\Model\Gallery;
use Xin\Module\Organization\Model\Organization;
use Xin\Module\System\Model\region;
use Xin\Module\User\Model\User;

/**
 * Created by PhpStorm.
 * User: VIPing
 * Date: 2018/9/3
 * Time: 10:21
 */
class basecontroller extends \Phalcon\Mvc\Controller
{
    public static $_ADMINID = 1;
    public $_postValidates = []; //只允许post方式请求
    public $regionInfo = [];
    public $prePath = '';

    //初始化鉴权  【细化到方法】
    public function  onConstruct(){
        $m = $this->dispatcher->getModuleName();
        $c = $this->dispatcher->getControllerName();
        $a = $this->dispatcher->getActionName();

        //方法限制参考：限制只能POST
        if(in_array($a,$this->_postValidates) && !$this->request->isPost()){
            $resp= new \Xin\Lib\MessageResponse('您无权限请求该页面', 'error',['goback','home','重新登录'=>Utils::url('admin/account/logout')]);
            echo $resp->getContent();
            exit;
        }


        //TODO 鉴权：角色是否拥有该权限（在app.php中已鉴权 暂时忽略）

        //记录操作日志
        if(!in_array($m."/".$c."/".$a,['admin/alarm/check']) ){
            $ticket = $this->di->get('auth')->getTicket();
            $query = $this->request->getQuery();
            $log  = new ActionLogs();
            $log->model = $m;
            $log->controller = $c;
            $log->action = $a ;
            $log->create_time = time();
            $log->creator = $ticket['username'];
            $log->params = json_encode($query);
            $log->save();
        }

    }
}