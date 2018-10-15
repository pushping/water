<?php
namespace Xin\App\Admin\Controller;

use Xin\App\Admin\Model\Flow;
use Xin\App\Admin\Model\FlowDetail;
use Xin\App\Admin\Model\Player;
use Xin\App\Admin\Model\System;
use Xin\Lib\SqlHelper;
use Xin\Module\Device\Model\Device;
use Xin\Module\Device\Model\DeviceType;
use Xin\Module\Gallery\Model\Gallery;

use Xin\Module\Alarm\Model\Devicealarm;
use Xin\Module\Alarm\Model\Devicealarmdetail;
use Xin\Module\Alarm\Model\Alarmlevel;
use Xin\Module\Alarm\Model\Alarmnotice;
use Xin\Lib\Utils;
use Xin\Lib\Httpclient as Httpclient;
use Xin\App\Api\Controller\Deviceapicontroller as deviceapi;
use Xin\App\Api\Controller\Deviceapi1controller as deviceapi1;
use Xin\App\Api\Controller\Deviceapi2controller as deviceapi2;

use Xin\Module\Area\Model\Area;
use Xin\App\Admin\Model\FloorData;
use Xin\App\Admin\Model\Devicescreenmodule;
use Xin\Model\Dictionary;
use Xin\Lib\MessageResponse;
use Xin\Module\Alarm\Model\Devicedata;
use Xin\Model\Config;
use Xin\Module\area\Model\areaType;

use Xin\Module\parking\Model\parking;
use Xin\Module\Parking\Model\ParkingDetail;
use Xin\Module\Parking\Model\ParkingLogs;


use Xin\Module\Polling\Model\Polling;
class IndexController extends basecontroller {
    public $defaultPlayers = 6;
    public $defaultPoint = 500;
    public $defaultPercent = 0.03;


    public function indexAction() {
        $count = Flow::count();
        $pagination = Utils::loadUserControl('\Xin\Lib\Ctrl\Pagination');
        $pagination->recordCount($count);
        list($start,$limit) = Utils::offset($pagination->pageIndex(),$pagination->pageSize());

        $games = Flow::query()
            ->limit($limit, $start)
            ->orderBy('id desc')
            ->execute()
            ->toArray();
        foreach ($games  as &$item){
            $item['createtime'] = date("Y-m-d H:i:s",$item['createtime']);
        }unset($item);

        //今日统计
        $countGame = Flow::count("createtime>".strtotime(date("Y-m-d")));
        $sumGain = Flow::query()
            ->columns('sum(gain_point) sgp')
            ->where("createtime>".strtotime(date("Y-m-d")))
            ->execute()
            ->toArray();
        $sumGain = round(floatval($sumGain[0]['sgp']),2);

        $this->view->setVars(['games'=>$games,'pagination'=>$pagination,'countGame'=>$countGame,'sumGain'=>$sumGain]);
    }

    //游戏详情
    public function gamedetailAction(){
        $id = $this->request->get('id','int',0);
        $game = Flow::findFirstById($id)->toArray();
        $game['createtime'] = date("Y-m-d H:i:s",$game['createtime']);

        $build= new \Phalcon\Mvc\Model\Query\Builder();
        $gameDetail = $build
            ->columns(['f.userid','f.real_point','left_point','plat_point','p.name'])
            ->from(['f'=>'Xin\App\Admin\Model\FlowDetail'])
            ->leftJoin("Xin\App\Admin\Model\Player","p.id=f.userid",'p')
            ->where("flowid = :fid:",['fid'=>$id])
            ->getquery()
            ->execute()
            ->toArray();
        $this->view->setVars(['game'=>$game,'pnum'=>sizeof($gameDetail),'detail'=>$gameDetail,'id'=>$game['id']]);
    }

    //新开一局
    public function newgameAction(){
        $limitPlayer = System::findFirstByName("game_players");
        $base_point = System::findFirstByName("base_point");
        $base_percent = System::findFirstByName("base_percent");
        $limit = $limitPlayer ? $limitPlayer->value : $this->defaultPlayers;
        $point = $base_point ? $base_point->value : $this->defaultPoint;
        $percent = $base_percent ? $base_percent->value : $this->defaultPercent;
        $this->view->setVars(['limit'=>$limit]);
        $this->view->setVars(['point'=>$point]);
        $this->view->setVars(['percent'=>$percent]);

    }

    public function expoAction(){
        $this->view->disable();
        $id = (int)$this->request->get('id','int',0);
        if($id){
            $build= new \Phalcon\Mvc\Model\Query\Builder();
            $dataList = $build
                ->columns(['f.userid','f.real_point','left_point','plat_point','p.name'])
                ->from(['f'=>'Xin\App\Admin\Model\FlowDetail'])
                ->leftJoin("Xin\App\Admin\Model\Player","p.id=f.userid",'p')
                ->where("flowid = :fid:",['fid'=>$id])
                ->getquery()
                ->execute();
            if($dataList){
                $base_point = System::findFirstByName("base_point");
                $base_percent = System::findFirstByName("base_percent");
                $point = $base_point ? $base_point->value : $this->defaultPoint;
                $percent = $base_percent ? $base_percent->value : $this->defaultPercent;
                return $this->ExportGameDetail($dataList->toArray(),['point'=>$point,'percent'=>($percent*100)."%"]);
            }
        }
    }

    private function ExportGameDetail($dataList,$systemSet){
        $resultPHPExcel = new \PHPExcel();
        //设置第一行
        $resultPHPExcel->getActiveSheet()->setCellValue('A1', '姓名');
        $resultPHPExcel->getActiveSheet()->setCellValue('B1', '积分');
        $resultPHPExcel->getActiveSheet()->setCellValue('C1', '抽成');
        $resultPHPExcel->getActiveSheet()->setCellValue('D1', '个人结余');
        $resultPHPExcel->getActiveSheet()->setCellValue('E1', '抽成基数');
        $resultPHPExcel->getActiveSheet()->setCellValue('F1', '百分比');

        $i = 2;
        foreach ($dataList as $item) {
            $resultPHPExcel->getActiveSheet()->setCellValue('A' . $i, $item['name']);
            $resultPHPExcel->getActiveSheet()->setCellValue('B' . $i, $item['real_point']);
            $resultPHPExcel->getActiveSheet()->setCellValue('C' . $i, $item['plat_point']);
            $resultPHPExcel->getActiveSheet()->setCellValue('D' . $i, $item['left_point']);
            $resultPHPExcel->getActiveSheet()->setCellValue('E' . $i, $systemSet['point']);
            $resultPHPExcel->getActiveSheet()->setCellValue('F' . $i, $systemSet['percent']);
            $i++;
        }
        //设置导出文件名
        $outputFileName = '游戏数据.xls';
        //设置导出参数
        $xlsWriter = new \PHPExcel_Writer_Excel5($resultPHPExcel);
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header('Content-Disposition:inline;filename="' . $outputFileName . '"');
        header("Content-Transfer-Encoding: binary");
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Pragma: no-cache");
        $xlsWriter->save($outputFileName);
        echo file_get_contents($outputFileName);
    }

    //AJAX 获取账号名
    public function getnameAction(){
        $id = (int)$this->request->getPost('id','int',0);
        if($id){
            $user = Player::findFirstById($id);
            if($user){
                return json_encode(['code'=>200,'msg'=>'获取成功','data'=>$user->name,'point'=>$user->point]);
            }
        }
        return json_encode(['code'=>-1,'msg'=>"用户获取失败"]);
    }

    //AJAX 保存本局数据
    public function savegameAction(){
        $limitPlayer = System::findFirstByName("game_players");
        $base_point = System::findFirstByName("base_point");
        $base_percent = System::findFirstByName("base_percent");
        $limit = $limitPlayer ? $limitPlayer->value : $this->defaultPlayers;
        $base_point = $base_point ? $base_point->value : $this->defaultPoint;
        $base_percent = $base_percent ? $base_percent->value : $this->defaultPercent;

        $this->db->begin();
        try{
            $sum_ptpoint = 0.00;
            $sum_point = 0;
            //检查参数
            for($i =0;$i<$limit;$i++){
                $id = $this->request->getPost('id_'.$i);
                $player = Player::findFirstById($id);
                if(!$player){
                    throw new \Exception("第".($i+1)."行玩家信息获取失败！");
                }
                $point = $this->request->getPost('point_'.$i);
                $sum_point += $point;
                if(intval($point) != $point){
                    throw new \Exception("第".($i+1)."行玩家分数格式异常！");
                }
                $pt_point = $point>$base_point ? round(floatval($point*$base_percent),2) : 0;
                $palyer_left = $this->request->getPost('palyer_left_'.$i);
                $deff = (floatval($point - $pt_point + $player->point) - floatval($palyer_left));
                if(-0.0001 > $deff || 0.0001 <$deff){
                    throw new \Exception("第".($i+1)."行玩家结算点数异常！(".($point - $pt_point + $player->point)."~".$palyer_left.")");
                }
                $sum_ptpoint += $pt_point;
            }
            if($sum_point !=0 ){
                throw new \Exception("本局合计分数异常！");
            }

            //保存本局游戏
            $newGame = new Flow();
            $newGame->createtime =  time();
            $newGame->gain_point = $sum_ptpoint;
            if(!$newGame->save()){
                throw new \Exception("本局信息保存失败，请稍后重试");
            }

            //保存明细 并更新玩家分数
            for($i =0;$i<$limit;$i++){
                $id = $this->request->getPost('id_'.$i);
                $point = $this->request->getPost('point_'.$i);
                $player = Player::findFirstById($id);
                $pt_point = $point>$base_point ? $point*$base_percent : 0;
                $player->point = $point - $pt_point + $player->point;
                if(!$player->save()){
                    throw new \Exception("第".($i+1)."行玩家信息保存失败！");
                }
                $detail =  new FlowDetail();
                $detail->flowid = $newGame->id ;
                $detail->userid = $id;
                $detail->real_point = $point;
                $detail->plat_point = $pt_point;
                $detail->left_point = $point-$pt_point;
                $detail->createtime = time();
                if(!$detail->save()){
                    throw new \Exception("本局信息保存失败，请稍后重试");
                }
            }
            $this->db->commit();
            return json_encode(['code'=>200,'msg'=>"更新成功"]);
        }catch (\Exception $e){
            $this->db->rollback();
            return json_encode(['code'=>-1,'msg'=>$e->getMessage()]);
        }

    }

    /**
     * 数据推送API 临时
     */
    public function pushV1Action()
    {
        // $str = '{"recordtime":"2018-07-09 08:33:31","metric":"ServiceProperties24","tag":{"deviceId":"2283c848-0288-4c73-8bf4-e650b85dea05"},"value":"alarm"}';
        //$str = '{"recordtime":"2018-08-05 17:06:31","metric":"tilt_alarm","tag":{"deviceId":"5ed65982-cd77-48b0-9246-0aa2d2873d34"},"value":"alarm","notice_type":"2"}';
        // $_POST = json_decode($str,true);
        // $_POST['tag'] = json_encode($_POST['tag']);
        if(empty($_POST)) exit('无数据上传');
        $data = [];
        $data['metric'] = $_POST['metric'];
        $data['record_time'] = strtotime($_POST['recordtime']);
        $data['tag'] = $_POST['tag'];
        $data['device_id'] = json_decode($_POST['tag'],true)['deviceId'];
        $data['device_data'] = is_array($_POST['value'])?json_encode($_POST['value'],JSON_UNESCAPED_UNICODE):$_POST['value'];
        $this->di->get('logger')->info(date('Y-m-d H:i:s').'设备数据上传,POST:'.json_encode($data));
        if(empty($data['device_id'])){
            $this->di->get('logger')->info(date('Y-m-d H:i:s').'无sn号');
            exit('无sn号');
        }
        $device = \Xin\Module\Device\Model\Device::findFirstByDid($data['device_id']);
        if(!$device){
            $this->di->get('logger')->info(date('Y-m-d H:i:s').'找不到该设备信息'.$data['device_id']);
            exit('找不到该设备信息'.$data['device_id']);
        }
        $data['create_time'] = time();
        //判断下是否为报警信息
        $res = Alarmlevel::findFirst([
            'device_type = :device_type: AND metric = :metric: ',
            'columns'=>['name,is_alarm,level,is_dispatch,notice_type'],
            'bind'=>[
                'device_type'=>$device->device_type,
                'metric'=>$data['metric']
            ]
        ]);
        if(!$res){
            $this->di->get('logger')->info(date('Y-m-d H:i:s').'找不到数据对应参数');
            exit('找不到数据对应参数');
        }
        $status = 0;
        if($res['is_alarm'] == '1'){//报警数据
            $data['update_time'] = $data['record_time'];
            if($device->status == 1 || $device->status == 3){
                $status = 2;//设备状态
            }
            $person_id = 0;
            if($device->person_id){
                $arr = explode(',', $device->person_id);
                if($arr && is_array($arr)) $person_id = intval($arr[0]);
            }
            //告警通知
            if($res['notice_type'] > 0){
                $old_notice = Alarmnotice::findFirst([
                    'device_id = :device_id: AND notice_type = :notice_type: AND status = :status: ',
                    'bind'=>[
                        'device_id'=>$data['device_id'],
                        'notice_type'=>$res['notice_type'],
                        'status'=>1
                    ],
                    'order'=>'id desc'
                ]);
                $go_notice = 1;
                if($old_notice){
                    //时间阙暂定3分钟 180s
                    $time_diff = 180;
                    if(time() - $old_notice->create_time < $time_diff){
                        $go_notice = 0;
                    }
                }
                if($go_notice > 0){
                    $notice_data = [];
                    $notice_data['notice_type'] = $res['notice_type'];//通知类型
                    $notice_data['device_id'] = $data['device_id'];
                    $notice_data['create_time'] = time();
                    $notice_data['update_time'] = $notice_data['create_time'];
                    $notice_data['content'] = $device->device_name.$res['name'];//通知内容
                    $notice_data['content'] = '您好，【'.$device->device_name.'】发生【'.$res['name'].'】，请及时处理。';
                    if(empty($device->person_id)){
                        $notice_data['remarks'] = '责任人未指派';
                    }else{
                        $notice_data['person_id'] = $person_id;
                        $person = \Xin\Module\Person\Model\Person::findFirstById($person_id);
                        if($person && $person->mobile){
                            $notice_data['mobile'] = $person->mobile;
                        }else{
                            $notice_data['remarks'] = '责任人手机号错误';
                        }
                    }
                    //插入数据 然后调接口
                    $alarmnotice = new Alarmnotice();
                    if($alarmnotice->create($notice_data)) {
                        $alarmnotice_id = $alarmnotice->id;
                        $result = $alarmnotice->notice($notice_data,$res['notice_type']);
                        if($result){
                            if($result['code'] == 2){
                                $result['status'] = 1;
                            }
                        }else{
                            $result['remarks'] = '接口调用失败';
                        }
                        $res_alarm = Alarmnotice::findFirstById($alarmnotice_id);
                        if(!$res_alarm->update($result)){
                            $this->di->get('logger')->error(date('Y-m-d H:i:s')."告警记录修改失败".$alarmnotice_id.implode(";", $device->getMessages()));
                        }
                    }else{
                        $this->di->get('logger')->error(date('Y-m-d H:i:s')."告警通知入库失败".implode(";",$alarmnotice->getMessages()));
                    }
                }
            }
            //判断是否存在该实时告警
            $old_alarm = \Xin\App\Admin\Model\Devicealarm::findFirst([
                'device_id = :device_id: AND metric = :metric: AND status=0',
                'columns'=>['id,alarm_times'],
                'bind'=>[
                    'device_id'=>$device->did,
                    'metric'=>$data['metric']
                ]
            ]);
            if($old_alarm){
                $devicemodel = \Xin\App\Admin\Model\Devicealarm::findFirstById($old_alarm['id']);
                $data['alarm_times'] = $old_alarm['alarm_times'] + 1;
                unset($data['record_time']);
                unset($data['create_time']);
            }else{
                $devicemodel = new \Xin\App\Admin\Model\Devicealarm();
            }
        }else{
            $status = $device->status==3?1:0;
            $devicemodel = new \Xin\App\Admin\Model\Devicedata();
        }
        if(!$devicemodel->save($data)){
            $this->di->get('logger')->error(date('Y-m-d H:i:s').implode(";", $devicemodel->getMessages()));
            exit(implode(";", $devicemodel->getMessages()));
        }else{
            if($res['is_alarm'] == '1'){//原子化 插入详细告警记录表
                $alarm_detail_data = [];
                $alarm_detail_data['metric'] = $data['metric'];
                $alarm_detail_data['tag'] = $data['tag'];
                $alarm_detail_data['device_id'] = $device->did;
                $alarm_detail_data['device_data'] = $data['device_data'];
                $alarm_detail_data['record_time'] = strtotime($_POST['recordtime']);
                $alarm_detail_data['alarm_id'] = $devicemodel->id;
                $alarm_detail_data['create_time'] = time();
                $devicealarmdetail = new Devicealarmdetail();
                if(!$devicealarmdetail->save($alarm_detail_data)){
                    $this->di->get('logger')->error('原子化告警数据插入失败'.implode(";", $devicealarmdetail->getMessages()));
                }
            }
            if($res['is_alarm'] == '1' && $res['is_dispatch'] == 1 && $status==2){//自动派单
                $order_data = [];
                $order_data['name'] = $device->device_name.$res['name'];
                $order_data['person'] = $person_id;
                $order_data['device'] = $device->id;//device表主键
                $order_data['alarm_id'] = $devicemodel->id;
                $order_data['area'] = $device->area;
                $order_data['organization'] = $device->organization;
                $order_data['create_time'] = time();
                $order_data['update_time'] = $order_data['create_time'];
                $order_data['order_class'] = $res['level'];
                $order = new \Xin\Module\Order\Model\Order();
                if(!$order->save($order_data)){
                    $this->di->get('logger')->info(date('Y-m-d H:i:s').'test155');
                    $this->di->get('logger')->error(date('Y-m-d H:i:s').implode(";", $order->getMessages()));
                    exit(implode(";", $order->getMessages()));
                }
            }
        }
        // 修改改设备状态
        if($status >0){
            if(!$device->update(['status'=>$status])){
                $this->di->get('logger')->error(date('Y-m-d H:i:s')."设备".$data['device_id']."状态修改失败".implode(";", $device->getMessages()));
                exit(implode(";", $device->getMessages()));
            }
        }
        exit('1');
    }

    /**
     * 设备数据接收API v2
     */
    public function pushAction()
    {
        // $str = '{"receiveTime":"'.date("Y-m-d H:i:s").'","data":"{\"parked\":\"2\"}","tag":"{\"manufacturer_id\":10025,\"device_type_id\":100007,\"device_model_id\":27,\"deviceId\":\"2550b884-99ef-11e8-989f-0242ac110002\"}"}';
        // $_POST = json_decode($str,true);
        if(empty($_POST)||empty($_POST['data'])||empty($_POST['tag'])) exit('无数据上传');
        $post_data = is_array($_POST['data'])?$_POST['data']:json_decode($_POST['data'],true);
        $tag = is_array($_POST['tag'])?$_POST['tag']:json_decode($_POST['tag'],true);
        if(empty($post_data)||empty($tag)) exit('数据解析错误'.json_encode($post_data));
        $device_id = $tag['deviceId'];
        $device_type = $tag['device_type_id'];
        $recordtime = strtotime($_POST['receiveTime']);
        $tag = json_encode($_POST['tag']);
        if(empty($device_id)) exit('无设备id');
        $this->di->get('logger')->info(date('Y-m-d H:i:s').'设备数据上传,POST:'.json_encode($_POST));

        $device = Device::findFirstByUuid($device_id);
        if(!$device) exit('找不到该设备信息'.$device_id);
        $device_id = $device->did;

        $base_data = [];
        $base_data['record_time'] = $recordtime;
        $base_data['tag'] = $tag;
        $base_data['device_id'] = $device_id;
        $base_data['device_type'] = $device_type;

        
        foreach ($post_data as $metric => $device_data) {
            $res = $this->getDic($metric,$device_type,$device_data);
            if(!$res) continue;//没找到字典配置 直接跳过
            $metric = $res['metric'];
            $data = $base_data;
            $data['metric'] = $metric;
            $data['device_data'] = $device_data;
            $data['create_time'] = time();
            /**接收地磁数据，改变停车位状态*/
            if ($device_type==parking::PARKING_DEVICE_TYPE) {
                $deviceinfo = device::findFirstByDid($device_id)->toArray();
                if(!$deviceinfo) exit('错误的设备id：'.$device_id);
                $areaInfo = area::findFirstById($deviceinfo['area']);
                //有车
                if ($metric=='parked1') {
                    $areaInfo->status = 2;
                }elseif($metric=='parked2'){
                    $areaInfo->status = 1;
                }

                if(!$areaInfo->save()){
                    $this->di->get('logger')->error('停车位状态更新失败'.implode(";", $areaInfo->getMessages()));
                }

                $last_p = \Xin\Module\Device\Model\DeviceData::findFirst([
                    'conditions'=>'device_id = :did: and metric in ({mtyps:array})',
                    'bind'=>['did'=>$device_id,'mtyps'=>['parked1','parked2']],
                    'order'=>'id desc'
                ]);
                if($last_p){
                    $last_p = $last_p->toArray();
                }else{
                    $last_p = ['metric'=>''];
                }
                //记录进出库记录
                if(in_array($metric,['parked1','parked2']) && $last_p['metric'] != $metric){
                    $detail = new ParkingDetail();
                    $detail->area_id = $areaInfo->id;
                    $detail->device_id = $device_id;
                    $detail->metric = $metric;
                    $detail->create_time = time();
                    if(!$detail->save()){
                        $this->di->get('logger')->error(implode(";", $detail->getMessages()));
                    }
                }

                //记录新的停车信息
                if($metric=='parked2'){
                    if($last_p && $last_p['metric'] == 'parked1'){ //本次信息为有车变更为无车
                        $last_p2 = \Xin\Module\Device\Model\DeviceData::findFirst([
                            'conditions'=>'device_id = :did: and metric =  :mtype: ',
                            'bind'=>['did'=>$device_id,'mtype'=>'parked2'],
                            'order'=>'id desc'
                        ]);
                        if($last_p2) {
                            $last_p2 = $last_p2->toArray();
                        }else{
                            $last_p2  = ['id'=>0];
                        }

                        $start_p1 = \Xin\Module\Device\Model\DeviceData::findFirst([
                            'conditions' => 'device_id = :did: and metric =  :mtype: and id>:p2id: ',
                            'bind' => ['did' => $device_id, 'mtype' => 'parked1', 'p2id' => intval($last_p2['id'])],
                            'order' => 'id asc'
                        ]);
                        if($start_p1){//有开始停车的记录 则新增一条有效停车记录
                            $start_p1 = $start_p1->toArray();
                            $parklog = new ParkingLogs();
                            $parklog->area_id = $areaInfo->id;
                            $parklog->device_id = $device_id;
                            $parklog->start_time = $start_p1['record_time'];
                            $parklog->end_time = time();
                            $parklog->create_time = time();
                            if(!$parklog->save()){
                                $this->di->get('logger')->error(implode(";", $parklog->getMessages()));
                            }
                        }
                    }
                }

            }

            $status = 0;
            if($res['is_alarm'] == '1'){//报警数据
                if($device_type == 100004){
                    $linkage = \Xin\Module\Linkage\Model\ActionLinkage::findFirst([
                        'pre_type = :pre_type: AND pre_metric = :pre_metric: AND status = 1',
                        'bind'=>['pre_type'=>$device_type,'pre_metric'=>$metric]
                    ]);
                    if($linkage){//告警设备联动
                        // 门锁101  user_id=3 bedChamber_id=4
                        // 门锁102  user_id=30 bedChamber_id=5
                        $params =  [
                            "client_account"=>'电信物联网公司',
                            "client_password"=>'123456',
                            "user_id"=>3,
                            "bedChamber_id"=>4,
                            "start_time"=>date('YmdHi',time()),
                            "end_time"=>date('YmdHi',time()+300)
                        ];
                        $api_url = $this->config->doorlock->base_api_url.'addRemote';
                        $doorlock_obj = new \Xin\Module\Doorlock\Controller\DoorlockController();
                        $ret = $doorlock_obj->doorlockCurl($api_url,$params,2);
                        $this->di->get('logger')->error("linkage ret【".$device_id."】:".json_encode($ret,JSON_UNESCAPED_UNICODE));

                        $params =  [
                            "client_account"=>'电信物联网公司',
                            "client_password"=>'123456',
                            "user_id"=>30,
                            "bedChamber_id"=>5,
                            "start_time"=>date('YmdHi',time()),
                            "end_time"=>date('YmdHi',time()+300)
                        ];
                        $ret = $doorlock_obj->doorlockCurl($api_url,$params,2);
                        $this->di->get('logger')->error("linkage ret【".$device_id."】:".json_encode($ret,JSON_UNESCAPED_UNICODE));

                        //多灵门锁 863703035003677
                        $params = [
                            'deviceId'=>'863703035003677',
                            'serviceId'=>'DoorLock',
                            'method'=>'LOCK',
                            'paras'=>json_encode(['status'=>'OPEN']),
                        ];
                        $headers = array("Content-type: application/x-www-form-urlencoded");
                        $curl = curl_init($this->config->doorlock->dorlink);
                        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
                        curl_setopt($curl, CURLOPT_TIMEOUT, 2); //设置超时
                        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
                        curl_setopt($curl, CURLOPT_POST, 1);
                        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($params));
                        $ret = curl_exec($curl);
                        if($ret === false){
                            $this->di->get('logger')->error('linkage ret dorlink curl error: ' . curl_error($curl));
                        }else{
                            $this->di->get('logger')->error("linkage ret dorling【".$device_id."】:".json_encode($ret,JSON_UNESCAPED_UNICODE));
                        }
                        curl_close($curl);
                    }
                }
                $data['update_time'] = $data['record_time'];

                $can_dispatch = 0;
                if($device->status == 1 || $device->status == 3){
                    $status = 2;//设备状态
                    $can_dispatch = 1;
                }else{
                    if($res['is_dispatch'] == 1){
                        //取出该设备的所有未完成工单
                        $phql = "SELECT a.* FROM dc_order AS o LEFT JOIN dc_device_alarm AS a ON o.alarm_id = a.id WHERE o.is_done != 1 AND a.device_id = '$device_id' AND a.metric = '$metric'";
                        $order_list = $this->di->get('db')->fetchall($phql);
                        if(empty($order_list)){
                            $can_dispatch = 1;
                        }
                    }     
                }
                $person_id = 0;
                $person_arr = [];
                if($device->person_id){
                    $person_arr = explode(',', $device->person_id);
                    if($person_arr && is_array($person_arr)) $person_id = intval($person_arr[0]);
                }
                //告警通知
                if($res['notice_type'] > 0){
                    $old_notice = Alarmnotice::findFirst([
                        'device_id = :device_id: AND status = :status: ',
                        'bind'=>[
                            'device_id'=>$device_id,
                            'status'=>1
                        ],
                        'order'=>'id desc'
                    ]);
                    $go_notice = 1;
                    if($old_notice){
                        //时间阙暂定3分钟 180s
                        $time_diff = 180;
                        if(time() - $old_notice->create_time < $time_diff){
                            $go_notice = 0;
                        }
                    }
                    if($go_notice > 0){
                        if($res['notice_type'] == 3){
                            $notice_type_arr = [1,2];
                        }else{
                            $notice_type_arr = [$res['notice_type']];
                        }
                        $area = Utils::areatoArray($device->area);//地点

                        foreach ($notice_type_arr as $notice_type) {
                            $notice_data = [];
                            $notice_data['device_id'] = $device_id;
                            $notice_data['create_time'] = time();
                            $notice_data['update_time'] = $notice_data['create_time'];
                            $notice_data['content'] = $device->device_name.$res['name'];
                            $notice_data['notice_type'] = $notice_type;//通知类型

                            if(empty($person_arr)){
                                $notice_data['remarks'] = '责任人未指派';
                                $alarmnotice = new Alarmnotice();
                                if(!$alarmnotice->create($notice_data)) {
                                    $this->di->get('logger')->error("告警通知入库失败".implode(";",$alarmnotice->getMessages()));
                                }
                            }else{
                                foreach ($person_arr as $item_person_id) {
                                    $insert_notice_data = $notice_data;
                                    $insert_notice_data['person_id'] = $item_person_id;
                                    $person = \Xin\Module\Person\Model\Person::findFirstById($item_person_id);
                                    if($person && $person->mobile){
                                        $insert_notice_data['mobile'] = $person->mobile;
                                    }else{
                                        $insert_notice_data['remarks'] = '责任人手机号错误';
                                    }

                                    //通知内容
                                    $notice_arr['username'] = $person->person_name;
                                    $notice_arr['daytime'] = date('Y-m-d H:i:s',$recordtime);
                                    $notice_arr['area'] = $area;
                                    $notice_arr['devicename'] = $device->device_name;
                                    $notice_arr['content'] = $res['name'];
        
                                    if ($notice_type==2) {
                                        $insert_notice_data['content'] = json_encode($notice_arr);
                                    }else{
                                        $insert_notice_data['content'] = '您好，'.$area.'的'.$device->device_name.'设备在'.date('Y-m-d H:i:s',$recordtime).'发生'.$res['name'].'，请及时处理。';
                                    }
         
                                    //插入数据 然后调接口
                                    $alarmnotice = new Alarmnotice();
                                    if($alarmnotice->create($insert_notice_data)) {
                                        $alarmnotice_id = $alarmnotice->id;
                                        $result = $alarmnotice->notice($insert_notice_data,$notice_type,$notice_arr);

                                        if($result){
                                            if($result['code'] == 2){
                                                $result['status'] = 1;
                                            }else if( $result['res_code']==0){
                                                $result['status']   = 1;
                                                $result['code']     = $result['res_code'];
                                                $result['msg']      = $result['res_message'];
                                                $result['voiceid']  = $result['idertifier'];
                                            }
                                        }else{
                                            $result['remarks'] = '接口调用失败';
                                        }

                                        $res_alarm = Alarmnotice::findFirstById($alarmnotice_id);
                                        if(!$res_alarm->update($result)){
                                            $this->di->get('logger')->error("告警记录修改失败".$alarmnotice_id.implode(";", $res_alarm->getMessages()));
                                        }
                                    }else{
                                        $this->di->get('logger')->error("告警通知入库失败".implode(";",$alarmnotice->getMessages()));
                                    }
                                }
                            }
                        }
                    }
                }
                //判断是否存在该实时告警
                $old_alarm = Devicealarm::findFirst([
                    'device_id = :device_id: AND metric = :metric: AND status=0',
                    'columns'=>['id,alarm_times'],
                    'bind'=>[
                        'device_id'=>$device_id,
                        'metric'=>$metric
                    ]
                ]);
                if($old_alarm){
                    $devicemodel = Devicealarm::findFirstById($old_alarm['id']);
                    $data['alarm_times'] = $old_alarm['alarm_times'] + 1;
                    unset($data['record_time']);
                    unset($data['create_time']);
                }else{
                    $devicemodel = new \Xin\App\Admin\Model\Devicealarm();
                }
            }else{
                $status = $device->status==3?1:0;
                $devicemodel = new \Xin\App\Admin\Model\Devicedata();
            }

            if(!$devicemodel->save($data)){
                $this->di->get('logger')->error(implode(";", $devicemodel->getMessages()));
                continue;
            }else{
                if($res['is_alarm'] == '1'){//原子化 插入详细告警记录表
                    $alarm_detail_data = [];
                    $alarm_detail_data['metric'] = $metric;
                    $alarm_detail_data['tag'] = $tag;
                    $alarm_detail_data['device_id'] = $device_id;
                    $alarm_detail_data['device_data'] = $device_data;
                    $alarm_detail_data['record_time'] = $recordtime;
                    $alarm_detail_data['alarm_id'] = $devicemodel->id;
                    $alarm_detail_data['create_time'] = time();
                    $devicealarmdetail = new Devicealarmdetail();
                    if(!$devicealarmdetail->save($alarm_detail_data)){
                        $this->di->get('logger')->error('原子化告警数据插入失败'.implode(";", $devicealarmdetail->getMessages()));
                        continue;
                    }
                }
                if($res['is_alarm'] == '1' && $res['is_dispatch'] == 1 && $can_dispatch==1){//自动派单
                    $order_data = [];
                    $order_data['name'] = $device->device_name.$res['name'];
                    $order_data['person'] = $person_id;
                    $order_data['device'] = $device->id;//device表主键
                    $order_data['alarm_id'] = $devicemodel->id;
                    $order_data['area'] = $device->area;
                    $order_data['organization'] = $device->organization;
                    $order_data['create_time'] = time();
                    $order_data['update_time'] = $order_data['create_time'];
                    $order_data['order_class'] = $res['level'];
                    $order = new \Xin\Module\Order\Model\Order();
                    if(!$order->save($order_data)){
                        $this->di->get('logger')->error(implode(";", $order->getMessages()));
                        continue;
                    }
                }
            }

            // 修改改设备状态
            if($status >0){
                if(!$device->update(['status'=>$status])){
                    $this->di->get('logger')->error("设备".$data['device_id']."状态修改失败".implode(";", $device->getMessages()));
                    continue;
                }
            }
        }
        exit('1');
    }

    /**
     * 取字典配置
     * @param  string $metric      标识字段
     * @param  string $device_type 设备类型
     * @param  string $device_data 设备数据
     * @return miexd               字典配置/false
     */
    protected function getDic($metric,$device_type,$device_data){
        //特殊转换
        if ($device_type==parking::PARKING_DEVICE_TYPE) {
            if($metric=='device_status'){
                $metric = 'parked';
                if($device_data == 0) $device_data = 2;//无车
            }
        }
        //判断下是否为报警信息
        $res = Alarmlevel::findFirst([
            'device_type = :device_type: AND metric = :metric: ',
            'columns'=>['metric,name,is_alarm,level,is_dispatch,notice_type,data_type,unit'],
            'bind'=>[
                'device_type'=>$device_type,
                'metric'=>$metric
            ]
        ]);
        if(!$res){
            $this->di->get('logger')->error("字典配置错误： 设备类型".$device_type."【".$metric."】标识不存在，".date('Y-m-d H:i:s'));
            return false;
        }else{
            if($res['data_type']>1){
                $unit_arr = json_decode($res['unit'],true);
                if(is_array($unit_arr)){
                    $new_metric = '';
                    if($res['data_type'] == 2){
                        $new_metric = $metric.$device_data;
                    }else if($res['data_type'] == 3){
                        $new_metric = $unit_arr[$device_data];
                    }
                    if(empty($new_metric)) return $res;
                    $new_res = Alarmlevel::findFirst([
                        'device_type = :device_type: AND metric = :metric: ',
                        'columns'=>['metric,name,is_alarm,level,is_dispatch,notice_type,data_type,unit'],
                        'bind'=>[
                            'device_type'=>$device_type,
                            'metric'=>$new_metric
                        ]
                    ]);
                    if(!$new_res){
                        $this->di->get('logger')->error("字典配置异常： 设备类型".$device_type."【".$metric."】标识的unit拆分后不存在【".$device_data."】配置，".date('Y-m-d H:i:s'));
                    }else{
                        $res = $new_res;
                    }
                }else{
                    $this->di->get('logger')->error("字典配置异常： 设备类型".$device_type."【".$metric."】标识的unit非json格式，".date('Y-m-d H:i:s'));
                }
            }
        }
        return $res;
    }
    
    public function get_dev_mappointAction()
    {
        $root = [];
        $this->view->setVar('isroot', in_array(0,$root));

        $status = $this->request->getpost("status");
        $where = "1=1 and a.status!=4";
        if (count($status)>0 && $status!='') {
            $status = \implode(',',$status);
            $where .= " and a.status in (".$status.")";
        }else{
            $where .= "  and a.status='".$status."'";
        }

        $init = $this->request->getPost("init");
        if ($init && $init>0) {
            $fulltext = Utils::areatoArray($init,'area');
            $data['init'] = $fulltext;

            $ids = Utils::getAllChildNode($init,'area');
            $ids = count($ids)>0?$init.",".\implode(',',$ids):$init;
            $where .= " and a.area in (".$ids.")";
        }else{
            $aids = $this->getAreaIds();
            if ($aids) {
                $area = \implode(',',$aids);
                $where .="and a.area in (".$area.")";
            }
        }
        //$ticket = $this->di->get('auth')->getTicket();
        $device_type = $this->request->getPost("device_type");
        if ($device_type) {
            $device_type = is_array($device_type)?implode(",",$device_type):$device_type;
            $where .=  " and a.device_type in (".$device_type.")";
        }

        // else{
        //     //是否是管理员权限
        //     if (!in_array(0,$root)) {
        //         $roles = $ticket['roles'];
        //         foreach ($roles as $k => $v) {
        //             $device_type[] = deviceType::findFirstByRole_id($v['id'])->toArray()['device_type'];
        //         }
        //         $device_type = is_array($device_type)?implode(",",$device_type):$device_type;
        //     }
        //     $where .=  " and a.device_type in (".$device_type.")";
        // }
    
        $device_id = $this->request->getPost("device_id");
        if ($device_id) {
            $where .= " and a.device_id=".$device_id;
        }

        //建筑子类型的集合
        $areaType = areaType::getAreaTypeById();
        $list = Utils::arrayToCut($areaType,areaType::HOUSE_BUILDING_ID);
        
        $list_arr = array_column($list,'id');
        array_push($list_arr,areaType::HOUSE_BUILDING_ID);
        

        $area_id = $this->request->getPost("area_id");
        if ($area_id) {
            $ids = Utils::getAllChildNode($area_id,'area');
            $ids = count($ids)>0?$area_id.",".\implode(',',$ids):$area_id;
            $where .= " and a.area in (".$ids.")";
        }

        $device_server_id = $this->request->getPost("device_server_id");
        if ($device_server_id) {
            $where .= ' and a.device_server_id  like \'%'.SqlHelper::escapeLike($device_server_id).'%\'';
        }
        
        $dictionary =dictionary::find(["name=?0 and status=?1 order by status asc ",'bind'=>["device_status",1]]);
        $device_status =Utils::arraytogroup($dictionary->toArray(),'val');

        $build= new \Phalcon\Mvc\Model\Query\Builder();
        $device=$build->from(['a'=>'device:device'])
            ->columns('a.id,a.did,a.device_name,a.device_server_id,a.device_image,a.organization,dt.name as device_type_name,dt.image,ar.map_center as building_point,a.latitude_longitude,a.device_install_address,a.device_type,ar.id as area_id,a.area,ar.area_type,at.deepth,a.status,dic.css,dic.val,dic.title,dt.image as map_img')
            ->where($where)
            ->leftJoin('_:dictionary','(dic.val=a.status and dic.name="device_status")',"dic")
            ->leftJoin('device:deviceType','dt.device_type=a.device_type','dt')
            ->leftJoin('Xin\Module\Area\Model\Area','ar.id=a.area','ar')
            ->leftJoin('Xin\Module\area\Model\areaType','at.id=ar.area_type','at')
            ->getQuery()
            ->execute();
        $build_device = deviceType::findResByfiled('device_type',['is_building',1]);

        /**同栋建筑物设备归类 */
        if ($device) {
            $device = $device->toArray();
            foreach($device as $k=>$v){
                if (in_array($v['device_type'],$build_device) && in_array($v['area_type'],$list_arr)) {
                    //var_dump($v['area_id']);
                    if ( $v['device_type'] !="100007") {
                        $ParentAreaId = area::ParentAreaByareaType($v['area_id'],areaType::HOUSE_BUILDING_ID);
                    }else{
                        $ParentAreaId = area::ParentAreaByareaType($v['area_id'],areaType::HOUSE_PARKING_ID);
                    }
                    $device[$k]['building_area_id'] = $ParentAreaId; 
                }
            };
        };

        /*设备数量统计*/
        $build= new \Phalcon\Mvc\Model\Query\Builder();
        $device_types = \Xin\module\device\dataTag::getTypeList();
        $types_device_list = [];

        $dictionary =dictionary::find(["name=?0 and status=?1 order by status asc ",'bind'=>["device_status",1]]);
        $device_status =Utils::arraytogroup($dictionary->toArray(),'val');

        foreach ($dictionary as $item) {
            $case[]= "sum(if(a.status=".$item->val.",1,0)) as ".$item->subname;

        }
        $case =\implode(",",$case);     


        $build= new \Phalcon\Mvc\Model\Query\Builder();
        $all_type_dev = reset($build->from(['a'=>'device:device'])->columns("count(a.id) as count,".$case)->where($where)->getQuery()->execute()->toArray());
        $type_map_list["全部"] = $all_type_dev;
        foreach ($device_types as $item) {
            $build= new \Phalcon\Mvc\Model\Query\Builder();
            $type_map_list[$item['name']] = reset($build
                        ->from(['a'=>'device:device'])
                        ->columns("count(a.id) as count,".$case)
                        ->where("a.device_type=".$item['device_type']." and ".$where)
                        ->getQuery()
                        ->execute()
                        ->toArray());  

            $type_map_list[$item['name']]["device_type"] = $item['device_type'];
        };

        $data['type_map_list'] = $type_map_list;
        $data['data'] = $device;
        $data['dictionary'] = $dictionary;
        $data['state'] = $device_status;
        $data['status'] = 'ok';
        return json_encode($data);        
    }

    public function devdetailAction()
    {
        $device_id = $this->request->get("device_id");
        if ($device_id) {
            $build= new \Phalcon\Mvc\Model\Query\Builder();
            $device=$build->from(['a'=>'device:Device'])
                ->columns('a.did,a.device_name,a.id,a.device_image,a.device_server_id,a.organization,a.device_install_address,a.status,dt.name as device_type')
                ->where("a.did='".$device_id."' and a.status!=4")
                ->innerJoin('device:deviceType','dt.device_type=a.device_type',"dt")
                ->getQuery()
                ->execute()
                ->toArray();
                
            if ($device[0]['device_image']) {
                $imageids = \explode(",",$device[0]['device_image']);
                $images_path = [];
                foreach ($imageids as $image) {
                    $images = Gallery::findFirstById($image)->toArray();
                    $images_path[] = ['title'=>$images['title'],'path'=>$images['path']];  
                }
            }

            $build= new \Phalcon\Mvc\Model\Query\Builder();
            $alarm=$build->from(['a'=>'alarm:Devicealarm'])
                    ->columns('a.record_time,a.id,al.name,a.device_id')
                    ->where('a.device_id="'.$device_id.'" and a.status=0')
                    ->innerJoin('alarm:Alarmlevel','al.metric=a.metric',"al")
                    ->getQuery()
                    ->execute();
            if ($alarm) {
               $alarm = $alarm->toArray();
            }
        
            
            $build= new \Phalcon\Mvc\Model\Query\Builder();
            $metrics=$build->from(['al'=>'alarm:Alarmlevel'])
                    ->columns('al.metric,al.name,al.unit')
                    ->where('d.did="'.$device_id.'"')
                    ->innerJoin('device:device','al.device_type=d.device_type and al.is_alarm=2',"d")
                    ->getQuery()
                    ->execute();
            $alarmData = [];
            if ($metrics) {
                foreach ($metrics as $item) {
                    $sql = "select a.device_data from ".Devicedata::getSource()." as a where a.device_id='".$device_id."' and a.metric='".$item->metric."' order by a.create_time limit 0,1";
                    $hisData =  $this->di->get('db')->fetchall($sql);
                    $device_data = reset($hisData)["device_data"]?:0;
                    $alarmData[] = ['device_data'=>$device_data,'name'=>$item->name,'unit'=>$item->unit];
                };
            }

            $this->view->setVars(['device_id'=>$device_id,"dictionary"=>$dictionary,"device"=>$device[0],'images'=>$images_path,'alarm'=>reset($alarm),'alarmData'=>$alarmData]);
        }
    }

    public function map_iframeAction()
    {
        $device_list = Device::query()
            ->columns("SUM(IF(status= 1, 1, 0)) AS normal,SUM(IF(status= 2, 1, 0)) AS alarm,SUM(IF(status= 3, 1, 0)) AS loss ,SUM(IF(status= 5, 1, 0)) AS init,device_type,count(id) as count")
            ->GROUPBy("device_type")
            ->execute()
            ->toArray();
        $device_types = \Xin\module\device\dataTag::getTypeList();
        $types_device_list = [];

        $dictionary =dictionary::find(["name=?0 and status=?1 order by status asc ",'bind'=>["device_status",1]]);
        $device_status =Utils::arraytogroup($dictionary->toArray(),'val');

        foreach ($dictionary as $item) {
            $case[]= "sum(if(a.status=".$item->val.",1,0)) as ".$item->subname;

        }
        $case =\implode(",",$case);     
        $all_case = str_replace("a.", "",$case);

        $all_type_dev = reset(Device::query()->columns("count(id) as count,".$all_case)->where("status!=4")->execute()->toArray());
        $type_map_list["全部"] = $all_type_dev;
        foreach ($device_types as $item) {
            $build= new \Phalcon\Mvc\Model\Query\Builder();
            $type_map_list[$item['name']] = reset($build
                        ->from(['a'=>'device:device'])
                        ->columns("count(a.id) as count,".$case)
                        ->where("a.device_type=".$item['device_type']." and a.status!=4")
                        ->getQuery()
                        ->execute()
                        ->toArray());  
            $type_map_list[$item['name']]["device_type"] = $item['device_type'];
        };
        $this->view->setVars(['type_map_list'=>$type_map_list]);
    }

    public function index_v2Action(){
    	$manholecover = Deviceapi::manholecoverAction();
    	$streetlight = Deviceapi::streetlightAction();
    	$smoke = Deviceapi::smokeAction();
    	$firehydrant = Deviceapi::firehydrantAction();
    	$orderlist = Deviceapi::orderlistAction();
    	$data['chat_data']['deviceinfo']['manholecover'] = json_decode($manholecover,true);
    	$data['chat_data']['deviceinfo']['streetlight'] = json_decode($streetlight,true);
    	$data['chat_data']['deviceinfo']['smoke'] = json_decode($smoke,true);
    	$data['chat_data']['deviceinfo']['firehydrant'] = json_decode($firehydrant,true);
    	$data['chat_data']['orderlist'] = json_decode($orderlist,true);
			
        $this->view->setVars(['data'=>json_encode($data)]);
    }
    public function index_v3Action(){
    	$manholecover = Deviceapi::manholecoverAction();
    	$streetlight = Deviceapi::streetlightAction();
    	$smoke = Deviceapi::smokeAction();
    	$firehydrant = Deviceapi::firehydrantAction();
    	$orderlist = Deviceapi::orderlistAction();
    	$data['chat_data']['deviceinfo']['manholecover'] = json_decode($manholecover,true);
    	$data['chat_data']['deviceinfo']['streetlight'] = json_decode($streetlight,true);
    	$data['chat_data']['deviceinfo']['smoke'] = json_decode($smoke,true);
    	$data['chat_data']['deviceinfo']['firehydrant'] = json_decode($firehydrant,true);
    	$data['chat_data']['orderlist'] = json_decode($orderlist,true);
        
        $this->view->setVars(['data'=>json_encode($data)]);
    }

 public function index_v5Action(){
        $root = [0];
        $this->view->setVar('isroot', in_array(0,$root));
        $bidWaterDiv = Deviceapi2::ammeterAnalysisAction();
    	$streetlight = Deviceapi2::deviceDataAction('100011');
    	$manholecover = Deviceapi2::deviceDataAction('100005');
    	$geomagnetic = Deviceapi2::deviceDataAction('100007');
    	$smoke = Deviceapi2::deviceDataAction('100004');
        $firehydrant = Deviceapi2::firehydrantAction();
        $env = Deviceapi2::envAction();
        $alarmAll = Deviceapi2::alarmAllAction();
        
    	$data['bidWaterDiv'] = json_decode($bidWaterDiv,true);
    	$data['streetlight'] = json_decode($streetlight,true);
    	$data['manholecover'] = json_decode($manholecover,true);
    	$data['geomagnetic'] = json_decode($geomagnetic,true);
        $data['smoke'] = json_decode($smoke,true);
    	$data['firehydrant'] = json_decode($firehydrant,true);
        $data['alarmAll'] = json_decode($alarmAll,true);

        $this->view->setVars(['data'=>json_encode($data),'env'=>json_decode($env,true)]);
    }

    public function index_v7Action(){
        $root = $this->getAreaRoot();
        $this->view->setVar('isroot', in_array(0,$root));
        $bidWaterDiv = Deviceapi2::ammeterAnalysisAction();
    	$streetlight = Deviceapi2::deviceDataAction('100011');
    	$manholecover = Deviceapi2::deviceDataAction('100005');
    	$geomagnetic = Deviceapi2::deviceDataAction('100007');
    	$smoke = Deviceapi2::deviceDataAction('100004');
        $firehydrant = Deviceapi2::firehydrantAction();
        $env = Deviceapi2::envAction();
        $alarmAll = Deviceapi2::alarmAllAction();
        
    	$data['bidWaterDiv'] = json_decode($bidWaterDiv,true);
    	$data['streetlight'] = json_decode($streetlight,true);
    	$data['manholecover'] = json_decode($manholecover,true);
    	$data['geomagnetic'] = json_decode($geomagnetic,true);
        $data['smoke'] = json_decode($smoke,true);
    	$data['firehydrant'] = json_decode($firehydrant,true);
        $data['alarmAll'] = json_decode($alarmAll,true);

        $this->view->setVars(['data'=>json_encode($data),'env'=>json_decode($env,true)]);
    }
     public function index_v6Action(){
            $root = $this->getAreaRoot();

            $bidWaterDiv = Deviceapi2::ammeterAnalysisAction();
        	$streetlight = Deviceapi2::deviceDataAction('100011');
        	$manholecover = Deviceapi2::deviceDataAction('100005');
        	$geomagnetic = Deviceapi2::deviceDataAction('100007');
        	$smoke = Deviceapi2::deviceDataAction('100004');
            $firehydrant = Deviceapi2::firehydrantAction();
            $env = Deviceapi2::envAction();
            $alarmAll = Deviceapi2::alarmAllAction();

        	$data['bidWaterDiv'] = json_decode($bidWaterDiv,true);
        	$data['streetlight'] = json_decode($streetlight,true);
        	$data['manholecover'] = json_decode($manholecover,true);
        	$data['geomagnetic'] = json_decode($geomagnetic,true);
            $data['smoke'] = json_decode($smoke,true);
        	$data['firehydrant'] = json_decode($firehydrant,true);
            $data['alarmAll'] = json_decode($alarmAll,true);

            $this->view->setVar('isroot', in_array(0,$root));
            $this->view->setVars(['data'=>json_encode($data),'env'=>json_decode($env,true)]);
        }

    public function index_v8Action(){
        $root = $this->getAreaRoot();
        $this->view->setVar('isroot', in_array(0,$root));
        $bidWaterDiv = Deviceapi2::ammeterAnalysisAction();
        $streetlight = Deviceapi2::deviceDataAction('100011');
        $manholecover = Deviceapi2::deviceDataAction('100005');
        $geomagnetic = Deviceapi2::deviceDataAction('100007');
        $smoke = Deviceapi2::deviceDataAction('100004');
        $firehydrant = Deviceapi2::firehydrantAction();
        $env = Deviceapi2::envAction();
        $alarmAll = Deviceapi2::alarmAllAction();

        $data['bidWaterDiv'] = json_decode($bidWaterDiv,true);
        $data['streetlight'] = json_decode($streetlight,true);
        $data['manholecover'] = json_decode($manholecover,true);
        $data['geomagnetic'] = json_decode($geomagnetic,true);
        $data['smoke'] = json_decode($smoke,true);
        $data['firehydrant'] = json_decode($firehydrant,true);
        $data['alarmAll'] = json_decode($alarmAll,true);

        $this->view->setVars(['data'=>json_encode($data),'env'=>json_decode($env,true)]);
    }

    //楼层管理
    public function floor_designerAction()
    {
        
    }  

    //楼层平面图
    public function floor_mapAction(){
        $area_id = $this->request->get("area_id");
        if (!$area_id || !$floor_info = area::findFirstById($area_id)->toArray()) {
            return new MessageResponse("参数错误","false");
        }

        if ($floor_info['area_type']!=4) {
            return new MessageResponse("当前区域类型不是楼层","false");
        }
    
        $this->view->setVar("floor_info",$floor_info);
    
        if(!$floor_config = FloorData::findFirstByArea_id($area_id)){
            $floor_config = new FloorData();
        }else{
            $this->view->setVar("floor_config",$floor_config->toArray());
        }  
        

        if ($this->request->isPost()) {
            $formData = $this->request->getPost("formData");
            $floorData= $this->request->getPost("floorData");
            $formData["data"] = $floorData;
            $formData["create_time"] = time();
            $formData["area_id"] = $area_id;

            try {
                if (!$floor_config->save($formData)) {
                    return new MessageResponse(implode(";", $floor_config->getMessages()));
                } else {
                    return new \Xin\Lib\MessageResponse('操作成功', 'succ');
                }
            } catch (\Exception $e) {
                $this->di->get('logger')->error($e->getMessage());
                return new MessageResponse("操作失败");
            }
        }
    }
    //路灯井盖
    public function light_coverAction()
    {
        $streetlight = Deviceapi::deviceDataAction('100011');
        $manholecover = Deviceapi::deviceDataAction('100005');
        $alarmList = Deviceapi::alarmListAction();
        $historyAlarm = Deviceapi::historyAlarmAction();
        $order = Deviceapi::orderAction();
        $this->view->setVars([
        		"streetlight"		=>	$streetlight,
        		"manholecover"	=>	$manholecover,
                "historyAlarm"	=>	$historyAlarm,
                "order"	        =>	$order,
        		"alarmList" 		=>	json_decode($alarmList,true)
        ]);
    }

    //烟感 消火栓 音柱
    public function light_cover1Action()
    {
        $alarmList = Deviceapi::alarmListAction();
        $historyAlarm = Deviceapi::historyAlarmAction();
        $order = Deviceapi::orderAction();
        $dataAll1 = Deviceapi::dataAll1Action();
        $deviceNumber = Deviceapi::deviceNumberAction();
        $this->view->setVars([
            "historyAlarm"	=>	$historyAlarm,
            "order"	        =>	$order,
            "dataAll"	        =>	$dataAll1,
            "deviceNumber"       =>	$deviceNumber,
            "alarmList" 		=>	json_decode($alarmList,true)
        ]);
    }


    public function screenModuleAction()//大屏显示
    {
        $status = $_GET['status']?:'';
        if($status){
            $this->view->setVar('status',$status);
        }
        $marquee=json_decode(deviceapi2::alarmListAction(),true);
        $alarmProportion=json_decode(deviceapi2::alarmProportionAction(),true);

        $_marquee=array();
        $pieArea=array();
        foreach ($marquee as $val){
            array_push($_marquee,array('date'=>$val['name'],'time'=>date('Y-m-d'),'value'=>$val['status1']));
        }
        foreach ($alarmProportion['data'] as $val){
            array_push($pieArea,array('name'=>$val['name'],'value'=>$val['value']));
        }
        $_marquee=json_encode($_marquee);
        $alarmcount = Devicealarmdetail::query()
                    ->columns("count(id) as count")
                    ->where('1=1')
                    ->execute()
                    ->toArray();

        $dsm = Devicescreenmodule::find(['columns'=>'name,type,source_type'])->toArray();
        $this->view->setVars(['modules'=>json_encode($dsm),'marqueeData'=>$_marquee,'pieArea'=>json_encode($pieArea),"alarmcount"=>reset($alarmcount)['count']]);
    }

    public function screenModule_v1Action()//大屏显示
    {
        $status = $_GET['status']?:'';
        if($status){
            $this->view->setVar('status',$status);
        }
        $marquee=json_decode(deviceapi2::alarmListAction(),true);
        $alarmProportion=json_decode(deviceapi2::alarmProportionAction(),true);

        $_marquee=array();
        $pieArea=array();
        foreach ($marquee as $val){
            array_push($_marquee,array('date'=>$val['name'],'time'=>date('Y-m-d H:i:s'),'value'=>$val['status1']));
        }
        foreach ($alarmProportion['data'] as $val){
            array_push($pieArea,array('name'=>$val['name'],'value'=>$val['value']));
        }
        $_marquee=json_encode($_marquee);
        $dsm = Devicescreenmodule::find(['columns'=>'name,type,source_type'])->toArray();
        $this->view->setVars(['modules'=>json_encode($dsm),'marqueeData'=>$_marquee,'pieArea'=>json_encode($pieArea)]);
    }

  public function screenModule_v2Action()//大屏显示
    {
        $status = $_GET['status']?:'';
        if($status){
            $this->view->setVar('status',$status);
        }
        $marquee=json_decode(deviceapi2::alarmListAction(),true);
        $alarmProportion=json_decode(deviceapi2::alarmProportionAction(),true);

        $_marquee=array();
        $pieArea=array();
        foreach ($marquee as $val){
            array_push($_marquee,array('date'=>$val['name'],'time'=>date('Y-m-d H:i:s'),'value'=>$val['status1']));
        }
        foreach ($alarmProportion['data'] as $val){
            array_push($pieArea,array('name'=>$val['name'],'value'=>$val['value']));
        }
        $_marquee=json_encode($_marquee);
        $dsm = Devicescreenmodule::find(['columns'=>'name,type,source_type'])->toArray();
        $this->view->setVars(['modules'=>json_encode($dsm),'marqueeData'=>$_marquee,'pieArea'=>json_encode($pieArea)]);
    }

    public function screenModule_v3Action()//大屏显示
    {
        $status = $_GET['status']?:'';
        if($status){
            $this->view->setVar('status',$status);
        }
        $marquee=json_decode(deviceapi2::alarmListAction(),true);
        $alarmProportion=json_decode(deviceapi2::alarmProportionAction(),true);

        $_marquee=array();
        $pieArea=array();
        foreach ($marquee as $val){
            array_push($_marquee,array('date'=>$val['name'],'time'=>date('Y-m-d H:i:s'),'value'=>$val['status1']));
        }
        foreach ($alarmProportion['data'] as $val){
            array_push($pieArea,array('name'=>$val['name'],'value'=>$val['value']));
        }
        $_marquee=json_encode($_marquee);
        $dsm = Devicescreenmodule::find(['columns'=>'name,type,source_type'])->toArray();
        $this->view->setVars(['modules'=>json_encode($dsm),'marqueeData'=>$_marquee,'pieArea'=>json_encode($pieArea)]);
    }

    public function screenModule_v4Action()//大屏显示
    {
        $status = $_GET['status']?:'';
        if($status){
            $this->view->setVar('status',$status);
        }
        $marquee=json_decode(deviceapi2::alarmListAction(),true);
        $alarmProportion=json_decode(deviceapi2::alarmProportionAction(),true);

        $_marquee=array();
        $pieArea=array();
        foreach ($marquee as $val){
            array_push($_marquee,array('date'=>$val['name'],'time'=>date('Y-m-d H:i:s'),'value'=>$val['status1']));
        }
        foreach ($alarmProportion['data'] as $val){
            array_push($pieArea,array('name'=>$val['name'],'value'=>$val['value']));
        }
        $_marquee=json_encode($_marquee);
        $dsm = Devicescreenmodule::find(['columns'=>'name,type,source_type'])->toArray();
        $this->view->setVars(['modules'=>json_encode($dsm),'marqueeData'=>$_marquee,'pieArea'=>json_encode($pieArea)]);
    }


    public function saveSMAction()
    {
        if ($this->request->isPost() == true) {
            $get_data=$this->request->getPost();
                foreach($get_data as $o=>$n){
                    $dsm = Devicescreenmodule::findFirstById($o+1);
                    if($dsm && $n['name']){
                        try {
                            if (!$dsm->update($n)) {
                                return new MessageResponse(implode(";", $dsm->getMessages()));
                            }
                        } catch (\Exception $e) {
                            $this->di->get('logger')->error($e->getMessage());
                            return json_encode(['status'=>'0']);
                        }
                    }else{
                        return json_encode(['status'=>'0']);
                    }
                }
                return json_encode(['status'=>'1']);
        }
    }

    //测试socket程序
    public function testsocketAction(){

    }


    public function testAction()
    {

        $HttpClient = new HttpClient();
        $target = $this->config['message']['url'];
        $accessTokenUri = $this->config['message']['accessTokenUri'];
        $app_Id = $this->config['message']['app_Id'];
        $app_Secret =  $this->config['message']['app_Secret'];
        $temp_id = $this->config['message']['template_id'];

        if ($this->cookies->has("message_token")) {
            $access_token = $this->cookies->get("message_token")->getValue();
        }else{
            $params = [
                'grant_type'=>'client_credentials',
                'app_id' => $app_Id,
                'app_secret'=>$app_Secret,
            ];
            
            $access_ret = $HttpClient->postform($accessTokenUri,http_build_query($params));
            $arr_ret = json_decode($access_ret,true);

            if ($arr_ret['res_code']=='0') {
                $access_token = $arr_ret['access_token'];
                $this->cookies->set("message_token",$access_token,time()+$arr_ret['expires_in']);//设备状态信息保留1分钟
            }
        }

        $message_data = [
            'username'=>'xx',
            'daytime'=>date('Y-m-d H:i:s',time()),
            'area'=>'xx',
            'devicename'=>'xx',
            'content'=>'xx'
        ];

        $params1 =  [
            "app_id"=>$app_Id,
            "acceptor_tel"=>'18960917793',
            "template_id"=>$temp_id,
            "access_token"=>$access_token,
            "template_param"=>json_encode($message_data),
            "timestamp"=>date('Y-m-d H:i:s',time())
        ];

        $ret =$HttpClient->postform($target,http_build_query($params1));
        var_dump($ret);exit;
    }

    /**
    * 大屏接口三接口
     */

     public function getDeviceDataAction()
     {
         $ticket = $this->di->get('auth')->getTicket();
         $cKey = 'G_devicedata_'.$ticket['uid'];
         if($this->cookies->has($cKey)){
             $cookieVal = $this->cookies->get($cKey)->getValue();
             $returnArr = json_decode($cookieVal,true);
         }else{
             $where = " status!=4 ";
             //根据设备类型统计数量
             $types = DeviceType::find(["1=1 and status=1"]);
             if ($types) {
                 $types = $types->toArray();
                 foreach ($types as $key => $item) {
                     $sql = $where." and device_type='".$item['device_type']."'";
                     $counts = device::query()->columns("count(id) as count")->where($sql)->execute()->toArray();
                     $kindType[$item['device_type']] =  reset($counts)['count'];

                     $TypeChat['x'][] = $item['name'];
                     $deviceTypes = device::query()->columns("sum(if(status=1,1,0)) as normal,sum(if(status=2,1,0)) as alarm")->where($sql)->execute()->toArray();

                     $alarm[] = $deviceTypes[0]['alarm'];
                     $normal[] = $deviceTypes[0]['normal'];
                 };
                 $TypeChat['data'] =  [['name'=>"正常","data"=>$normal],['name'=>'告警','data'=>$alarm]];

                 //根据设备状态
                 $count = device::query()
                     ->columns("count(id) as count,sum(if(status=1,1,0))as normal,sum(if(defense_status=1,1,0)) as nodefense_status,sum(if(status=2,1,0)) as alarm,sum(if(status=3,1,0)) as outline,sum(if(status=5,1,0)) as init")
                     ->where($where)
                     ->execute()
                     ->toArray();
             };
             $returnArr = ['count'=>$count[0],'kindType'=>$kindType,'TypeChat'=>$TypeChat];
             $this->cookies->set($cKey,json_encode($returnArr),time()+60);//设备状态信息保留1分钟
             $this->cookies->send();
         }
         return json_encode(['status'=>'ok','data'=>$returnArr]);
     }

     public function getChatDataAction()
     {
         $deviceType = $this->request->getPost("deviceType");
//         $ticket = $this->di->get('auth')->getTicket();
//         $cKey = 'G_chatdata_'.$deviceType."_".$ticket['uid'];
//         if($this->cookies->has($cKey)){
//             $cookieVal = $this->cookies->get($cKey)->getValue();
//             $data = json_decode($cookieVal,true);
//         }else{
             $status = ["normal"=>"正常","init"=>"未布防","alarm"=>"告警"];
             $devices = device::query()
             ->columns('sum(if(status=5,1,0)) as init,sum(if(status=1,1,0)) as alarm,sum(if(status=2,1,0)) as normal')
             ->where("1=1 and status!=4 and device_type=".$deviceType)
             ->execute()
             ->toArray();

             $data = [];
             foreach ($devices[0] as $key => $value) {
                 $e['name'] = $status[$key];
                 $e['value'] = $value+0;
                 $e['atype'] = $key;
                 $data['data'][] = $e;
                 $data['labels'] =[];
                 $data['title'] = reset(deviceType::findFirstByDevice_type($deviceType)->toArray());
             }
//             $this->cookies->set($cKey,json_encode($data),time()+60);//设备状态信息保留1分钟
//             $this->cookies->send();
//         }
        return json_encode(['status'=>'ok','data'=>['devices'=>$data]]);
    }

    public function getOrderDataAction()
    {
        $ticket = $this->di->get('auth')->getTicket();
        $cKey = 'G_orderdata_'.$ticket['uid'];
        
        if($this->cookies->has($cKey)){
            $cookieVal = $this->cookies->get($cKey)->getValue();
            $order = json_decode($cookieVal,true);
        }else{
            $where = "1=1";
            $orderStatus = ['countall'=>'0','done'=>'1','doing'=>'2','comfired'=>'3'];
            foreach ($orderStatus as $key=>$item) {
                $where = $key!='countall'?"o.status=".$item:'1=1';
                $build = new \Phalcon\Mvc\Model\Query\Builder();
                $count = $build->from(['o'=>'order:order'])
                    ->columns("count(o.id) as count")
                    ->where($where)
                    ->leftJoin('device:device','d.id=o.device',"d")
                    ->getQuery()
                    ->execute()
                    ->toArray();
                $order[$key] = $count;
            }
            $this->cookies->set($cKey,json_encode($order),time()+300);//订单信息保留5分钟
            $this->cookies->send();
        }
       return new \Xin\Lib\MessageResponse($order,"success");
    }


    public function getPollDataAction()
    {
        $ticket = $this->di->get('auth')->getTicket();
        $cKey = 'G_polldata_'.$ticket['uid'];
        $cookieVal = $this->cookies->get($cKey)->getValue();
        $data = json_decode($cookieVal,true);
        if($this->cookies->has($cKey)){
            $cookieVal = $this->cookies->get($cKey)->getValue();
            $data = json_decode($cookieVal,true);
        }else{
            $count = polling::query()
                ->columns("count(id) as count,sum(if(status=0,1,0)) as done,sum(if(status=1,1,0)) as doing")
                ->where("1=1")
                ->execute()
                ->toArray();

            $data['data'] =[
                ['value'=>$count[0]['done'],'name'=>'已巡检'],
                ['value'=>$count[0]['doing'],'name'=>'未巡检'],
            ];
            $data['name'] = "巡检任务";
            $data['labels'] = [];
            $data['allcount'] = $count[0]['count'];
            $this->cookies->set($cKey,json_encode($data),time()+300);//巡检任务保存5分钟
            $this->cookies->send();
        }
        return new \Xin\Lib\MessageResponse($data,"success");
    }


}   