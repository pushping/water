<?php

namespace Xin\Lib;

use Phalcon\Di;


class Utils
{
    /**
     * @param $url
     * @param array $params
     * @return string
     */
    public static function url($url, $params = null,$fullpath=false)
    {
        static $urlObj;
        if (!isset($urlObj)) {
            $urlObj = Di::getDefault()->get('url');
        }
        $i=strpos($url,'?');
        if($i!==false){
            $p=substr($url,$i+1);
            $url=substr($url,0,$i);
            foreach(explode('&',$p) as $item){
                list($k,$v)=explode('=',$item);
                (!isset($params[$k]) || strpos($k,'[')) && $params[$k]=$v;
            }
        }
        return $urlObj->get($url, $params);
    }

    /**
     * 根据页码和页大小返回limit和offset
     * @param $page
     * @param $pagesize
     * @return array [offset,limit]
     */
    public static function offset($page=null,$pagesize=null){
        !$page && $page=Di::getDefault()->getRequest()->getQuery('page', 'absint', 1, true);
        !$pagesize && $pagesize=Di::getDefault()->getRequest()->getQuery('pagesize', 'absint', 10, true);

        $page=intval($page);
        $page=$page<1 ? 1:$page;
        $pagesize=intval($pagesize);
        ($pageSize > 100 || $pageSize < 1) && $pageSize = 10;
        return [($page-1)*$pagesize,$pagesize];
    }

    /**
     * 字符串截取
     * @param str 要截取的字符串
     * @param start=0 开始位置，默认从0开始
     * @param length 截取长度
     * @param charset=”utf-8″ 字符编码，默认UTF－8
     * @param suffix='...' 是否在截取后的字符后面显示指定符号，默认显示'...'，false为不显示
     * */
    public static function subString($str, $start = 0, $length, $charset = "utf-8", $suffix = '') {

        if (mb_strlen($str, $charset) <= $length)
            $suffix = false;

        if (function_exists("mb_substr")) {
            $slice= mb_substr($str, $start, $length, $charset);
        }elseif (function_exists('iconv_substr')) {
            $slice=iconv_substr($str, $start, $length, $charset);
        }else{
            $re['utf-8'] = "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef][x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";
            $re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";
            $re['gbk'] = "/[x01-x7f]|[x81-xfe][x40-xfe]/";
            $re['big5'] = "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";
            preg_match_all($re[$charset], $str, $match);
            $slice = join("", array_slice($match[0], $start, $length));
        }
        if ($suffix)
            return $slice . $suffix;

        return $slice;
    }

    public static function loadUserControl($ctrlName, $params = null)
    {
        $di=Di::getDefault();
        if($ctrlName{0}!=='\\'){
            $ctrlName=$di->get('dispatcher')->getNamespaceName().'Ctrl\\'.$ctrlName;
        }
        $ctrl = new $ctrlName($params['id']);
        if($params) $ctrl->setAttribs($params);
        return $ctrl;
    }

    //时间差
	function timediff( $begin_time, $end_time )
	{
	  if ( $begin_time < $end_time ) {
		$starttime = $begin_time;
		$endtime = $end_time;
	  } else {
		$starttime = $end_time;
		$endtime = $begin_time;
	  }
	  $timediff = $endtime - $starttime;
	  $days = intval( $timediff / 86400 );
	  $remain = $timediff % 86400;
	  $hours = intval( $remain / 3600 );
	  $remain = $remain % 3600;
	  $mins = intval( $remain / 60 );
	  $secs = $remain % 60;
	  $res = array( "day" => $days, "hour" => $hours, "min" => $mins, "sec" => $secs );
	  return $res;
	}	

    function cunset($arr=[],$file='')
    {
        unset($arr[$file]);
        return $arr;
    }

    /**
     * 扁平数组转为树
     * @param array $lists
     * @param int $parentid
     * @param int $depth
     * @return array
     */
    public static function arrayToTree($lists,$parentid=0,$depth=0,$ignoreShow=true){
        $newarr=array();
        foreach($lists as $k=>$item){
            if($ignoreShow && array_key_exists('isshow',$item) && !$item['isshow']) continue;
            if($item['parentid'] == $parentid){
                $item['depth']=$depth;
                unset($lists[$k]);
                if($child=self::arrayToTree($lists,$item['id'],$depth+1,$ignoreShow)){
                    $item['childs']=$child;
                }
                $newarr[]=$item;
            }
        };
        return $newarr;
    }

    // //根据parentid转偏平数组
    // public function arraytoeTree($lists,$parentid=0,$depth=0,$ignoreShow=true$lists,$parentid=0,$depth=0,$ignoreShow=true)
    // {   
    //     $newarr=array();
    //     foreach($lists as $k=>$item){
    //         if($ignoreShow && array_key_exists('isshow',$item) && !$item['isshow']) continue;
    //         if($item['parentid'] == $parentid){
    //             $item['depth']=$depth;
    //             unset($lists[$k]);
    //             if($child=self::arrayToTree($lists,$item['id'],$depth+1,$ignoreShow)){
    //                 $item['childs']=$child;
    //             }
    //             $newarr[]=$item;
    //         }
    //     };
    //     return $newarr;   
    // }

    public static function arrayToMultiTree($lists){
        $tmp_arr = $lists;
        foreach ($lists as &$item){
            $item['isChild']= 0;
            foreach ($tmp_arr as $temp){
                if(intval($item['parentid']) == intval($temp['id'])){
                    $item['isChild'] = 1;break;
                }
            }
        }unset($item);
        $returnarr = [];
        $mark = [];
        foreach ($lists as $item){
            if(!$item['isChild'] && !in_array($item['parentid'],$mark)){
                $mark[] = $item['parentid'];
                $res = self::arrayToTree($lists,$item['parentid']);
                $returnarr = array_merge($returnarr,$res);
            }
        }
        return $returnarr;
    }

    /**
     * 取出parentid的数组
     * @param array $lists
     * @param int $parentid
     * @param int $depth
     * @return array
     */
     public static function arrayToCut($lists,$parentid=0,$depth=0,$ignoreShow=true){
        $newarr=array();
        foreach($lists as $k=>$item){
            if($item['parentid'] == $parentid){
                $item['depth']=$depth;
                unset($lists[$k]);
                if($child=self::arrayToCut($lists,$item['id'],$depth+1,$ignoreShow)){
                    array_push($newarr,$child[0]);
                }
                array_push($newarr,$item);
            }
        };
        return $newarr;
    }

  

    /**
     * jtree插件格式转化
     */
     public static function jTree($lists){
            $html = '';
            $html .= "<li>".$lists[0]['name']."<ul>";
            foreach($lists as $i=>$o){
                if($o['childs']){
                    $html .=self::jTree($o['childs']);
                }else{
                    $html .="<li data-jstree='{\"type\":\"".$o['name']."\"}'>".$o['name']."</li>";
                }
            }
            $html .= "</ul></li>";
            return  $html;
    }


    public static function findChildrenInList($list,$pid){
        $result=[];
        foreach($list as $item){
            if($item['parentid']==$pid){
                $result[]=$item;
                $result=array_merge($result,self::findChildrenInList($list,$item['id']));
            }
        }
        return $result;
    } 

    /**
     * 是否是全数字的数组
     */
    public static function isNumericArray($arr,$gtZero=true){
        if(!is_array($arr) || count($arr)==0) return false;
        foreach ($arr as $p) {
            if (!is_numeric($p) || ($gtZero && $p<=0))  return false;
        }
        return true;
    }

	/**
	 * 比较源是否被目标兼容，满足前缀一致且参数中没有不一样的值为兼容
	 * 如role/index/index?id=5相对于/role/index/index?id=5&t=1不兼容
	 * 如role/index/index?id=5&t=1相对于/role/index/index?id=5兼容
	 * 如role/index/index?id=5相对于/role/index/index?id=4&t=1不兼容
	 * @param string $source
	 * @param string $target
	 * @return boolean
	 */
    public static function compatibleAccess($source,$target){
		$source=trim(strtolower($source));
		$target=trim(strtolower($target));
		$i=strpos($source,'?');
        $j=strpos($target,'?');
        $s_acc=$i===false? $source : substr($source,0,$i);
        $t_acc=$j===false? $target : substr($target,0,$j);
        if($s_acc!=$t_acc) return false; //accesskey不一致直接算不匹配
        if($j===false) return true; //目标没有筛选条件限定,即为宽松，算匹配
        if($i===false && $j!==false) return false; //目标有筛选条件限定而源没有，算不匹配

        ($k=strrpos($source,'#'))!==false && $source=substr($source,0,$k-1);
        ($k=strrpos($target,'#'))!==false && $target=substr($target,0,$k-1);
        $s_ps=explode('&',substr($source,$i+1));
        $t_ps=explode('&',substr($target,$i+1));
        if(count($s_ps)<count($t_ps)) return false; //目标筛选条件多于源，算不匹配

        foreach($t_ps as $v){
            if(!in_array($v,$s_ps)) return false; //目标筛选条件在源不存在，算不匹配
        }
        return true;
    }
    
    public static function callColumnFunc($val,$str,$area=false){
        if(!$str) return $val;
        $i=strpos($str,'(');
        $fun=$i===false?$str:substr($str,0,$i);
        if(method_exists('\Xin\Lib\Utils',$fun)){
            if($i===false) return call_user_func_array(['\Xin\Lib\Utils', $fun], [$val,$area]);
            eval('$res=\Xin\Lib\Utils::'.$fun.'($val,'.substr($str,$i+1).';');

            return $res;
        }else{
            if($i===false) return call_user_func_array($fun, [$val]);
            eval('$res='.$fun.'($val,'.substr($str,$i+1).';');
            return $res;
        }
    }

    public static function statusText($val){
        $list=['enable'=>'正常','disable'=>'禁用','deleted'=>'删除'];
        return $list[$val]?$list[$val]:'未知';
    }
    //checkbox
    public static function idCheckbox($val){
        return '<input type="checkbox" class="i-checks" name="id" value="'.$val.'" autocomplete="off">';
    }
    //设备状态
    public static function devStatusText($val){
        $Dictionary = new \Xin\Model\Dictionary;
        $list = $Dictionary->get_device_status("device_status");
        
        $label = $list[$val][1]?$list[$val][1]:'label-default';
        $val = $list[$val][0]?$list[$val][0]:'未知';
        return '<span class="label label-xs '.$label.'">'.$val.'</span>';
    }

    //布防状态
    public static function devDefenseText($val){
        $list=['1'=>['已布防','label-success'],'2'=>['未布防','label-danger']];
        $label = $list[$val][1]?$list[$val][1]:'label-default';
        $val = $list[$val][0]?$list[$val][0]:'未知';
        return '<span class="label label-xs '.$label.'">'.$val.'</span>';
    }

    public static function categoryTitle($catid){
        $obj= \Xin\Module\Category\Model\Category::findFirstById($catid);
        return $obj ? $obj->title: '';
    }
    public static function img($path,$width=0,$height=0){
        return '<img src="'.Di::getDefault()->get('config')['module']['attachment']['uploadUriPrefix'].$path.'" style="'.($width?"width:{$width}px;":'').($height?"height:{$height}px;":'').'"/>';
    }
    public static function thumb($path,$width=0,$height=0){
        return Di::getDefault()->get('config')['module']['picture']['uploadUriPrefix'].$path.'?w='.$width.'&h='.$height;
    }

    public static function date($val){
        return $val ? date('Y-m-d',$val):'1970-01-01';
    }
    public static function time($val){
        return $val ? date('Y-m-d H:i:s',$val):'1970-01-01 00:00:00';
    }


    public static function strToarray($str){
        return json_decode($str,true);
    }
    
    public static function modellink($link,$object){
        $m=Di::getDefault()->get('dispatcher')->getModuleName();
		$c=Di::getDefault()->get('dispatcher')->getControllerName();
        $link=str_replace(['[VIEW]','[EDIT]','[DELETE]','[ANALYSE]','[TODO]','[CHART]'],[Utils::url("$m/$c/edit",['id'=>$object['id']]),Utils::url("$m/$c/edit",['id'=>$object['id']]),Utils::url("$m/$c/delete",['id'=>$object['id']]),Utils::url("$m/$c/analyse",['id'=>$object['id'],Utils::url("$m/$c/todo",['id'=>$object['id']]),Utils::url("$m/$c/chart",['id'=>$object['id']])])],$link);
        return $link;
    }

    public static function getLevel($val){
        $list=["1"=>['一级告警','label-danger'],"2"=>['二级告警','label-secondary'],"3"=>['三级告警','label-level3'],"4"=>['四级告警','label-warning']];
        $label = $list[$val][1]?$list[$val][1]:'label-default';
        $val = $list[$val][0]?$list[$val][0]:'未知';
        return '<span class="label label-xs '.$label.'">'.$val.'</span>';
    }

    public static function getOrderstatus($val){
        //0:已完成 1:待确认 2:待处理
        $list=[1=>'已完成',2=>'待处理',3=>'待确认'];
        return $list[$val]?$list[$val]:'未知';
    }
    public static function getOrderLevel($val){
        //0:普通 1:紧急 2:严重
        $list=["1"=>['普通','label-danger'],"2"=>['紧急','label-secondary'],"3"=>['严重','label-level3']];
        return '<span class="label label-xs '.$list[$val][1].'">'.$list[$val][0].'</span>';
    }
    public static function getOderperson($val){
        $person = \explode(',',$val);
        $str_person = '';
        foreach ($person as $key => $value) {
            $str_person .= self::areatoName($value,'person','person_name').",";
        }

        return substr($str_person,0,-1);
    }
    public static function typetoName($val){
        $obj= \Xin\Module\Device\Model\DeviceType::findFirstByDevice_type($val);
        return $obj?$obj->name:'';
    }

    //厂商
    public static function manuToName($val){
        $obj= \Xin\Module\Device\Model\Manufacturers::findFirstByProducerId($val);
        return $obj?$obj->name:'';
    }

    public static function getTwoDimensionArrayField($arr,$field='id'){
        $tmp = [];
        if(!is_array($arr) || empty($field)) return $tmp;
        foreach ($arr as $v) {
            $tmp[] = $v[$field];
        }
        return $tmp;
    }

    public static function areatoName($val,$preName,$field)
    {

        $obj ="Xin\Module\\".$preName."\Model\\".$preName;

        $obj = new $obj;
        $obj = $obj::findFirstById($val);
        if ($field) {
            return $obj?$obj->$field:'';
        }else{}
            return $obj?$obj->name:'';
       
    }

    //查询父级名称
    public static function areatoArray($val,$preName='area'){
        $preName = $preName?:"area";
        $obj ="Xin\Module\\".$preName."\Model\\".$preName;
        $obj = new $obj;
        $arr_obj = $obj::find("1=1");
        
        $current =$obj::findFirstById($val);
        foreach($arr_obj->toArray() as $k=>$v){
                if ($current->parentid==$v['id']) {
                    $item .= $v['name'];
                    $item = self::areatoArray($v['id'],$preName);
                } 
        }  

        $item .= $current->name;
        return $item;
    } 

    //查询父级名称
    public static function areatoArea($val,$area=''){
        $preName = "area";
        $obj ="Xin\Module\\".$preName."\Model\\".$preName;
        $obj = new $obj;
        $arr_obj = $obj::find("1=1");
        
        $current =$obj::findFirstById($val);
        foreach($arr_obj->toArray() as $k=>$v){
                if ($current->parentid==$v['id']) {
                    $item .= $v['name'];
                    $item = self::areatoArray($v['id'],$preName);
                } 
        }  

        $item .= $current->name;
        if($area){
            $item = str_replace($area,'',$item);
        }
        return $item;
    } 


    /**
     * 取某组织id下的所有组织节点id
     */
    static function getAllChildNode($id,$m='Organization',&$ids=[]){
        if($m == 'Organization'){
            $child_arr = \Xin\Module\Organization\Model\Organization::find([
                "parentid = $id",
                'columns'=>['id']
            ])->toArray();
        }else{
            $child_arr = \Xin\Module\Area\Model\Area::find([
                "parentid = $id",
                'columns'=>['id']
            ])->toArray();
        }
        if($child_arr){
            foreach( $child_arr as $v){
                $ids[] = $v['id'];
                $ids = self::getAllChildNode($v['id'],$m,$ids);
            }
        }
        return $ids;
    }

    /**
     * 计算时间周期/天
     * @param  [type] $begin_time [description]
     * @param  [type] $end_time   [description]
     * @return [type]             [description]
     */
    static function betweenDays($begin_time,$end_time){
        $diff = $end_time-$begin_time;
        $days = 1;
        if($diff > 86400){
            $days = ceil($diff/86400);
        }
        return $days;
    }

    /**
     * 格式化时间戳
     * @param  string $time 时间戳
     * @param  string $fmt  需要的格式
     * @return string       格式化后
     */
    static function formartTime($time,$fmt = 'Y-m-d H:i:s'){
        return $time?date($fmt,$time):'';
    }

    /**
     * 返回相对时间
     * @param  string $date 时间戳
     * @return string       相对时间
     */
    static function getRelativeTime($date) {
        $diff = time() - $date;
        if ($diff<60)
            return $diff."秒前";
        $diff = round($diff/60);
        if ($diff<60)
            return $diff."分钟前";
        $diff = round($diff/60);
        if ($diff<24)
            return $diff."小时前";
        $diff = round($diff/24);
        if ($diff<7)
            return $diff."天前";
        $diff = round($diff/7);
        if ($diff<4)
            return $diff."星期前";
        return "on ".date("Y-m-d", $date);
    }

    /**
     * 返回星期几
     * @param  string $weekstr 日期字符串
     */
     static function getWeekName($weekstr) {
        $arr  = \explode(",",$weekstr);
        $list = ["1"=>"一","2"=>"二","3"=>"三","4"=>"四","5"=>"五","6"=>"六","0"=>"日"];
        $return = [];
        foreach ($arr as $item) {
            $return[] = $list[$item];
        }
        return \implode(",",$return);
    }

    /**
     * selected checked
     */
    static function getActive($v,$m,$active='selected'){
        if($v == $m){
            return $active;
        }
    }

    /**
     *  接口调用
     */
    public static function api_query($url,$appsecret,$array=false,$method="get")
    {
        if($array){
            ksort($array);
            foreach ($array as $key => $value) {
                   $api_str .= '&'.$key.'='.$value; 
            }
            $api_str = substr($api_str,1);
            $encode_sign = base64_encode(hash_hmac("sha1",$api_str,$appsecret,$raw_output=True));
            $encode_sign = urlencode($encode_sign);
        }   
        $api_params = $api_str."&sign=".$encode_sign;
        var_dump($api_params);exit;
        $HttpClient = new HttpClient();
        $ret = $HttpClient->postform($url,$api_params);
        var_dump($ret);exit;
        return $ret;
    }
    /**
     *  路灯接口调用
     */
     public static function streetlight_query($url,$appsecret,$array=false,$method="get")
     {

         $HttpClient = new HttpClient();
         if ($method=="get")
            $ret = json_decode($HttpClient->request($api_url),true);
             
         return $ret;
     }

    //数组按照特定字段分组
    public static function arraytogroup($array,$fieldname){
        $newA = [];
        $keys = array_filter(array_unique(array_column($array,$fieldname)));
        foreach ($array as $key => $value) {
            if ($value[$fieldname]==NUll ) {
                $newA[][] = $value;
            }
            else{
                foreach ($keys as $k => $v) {
                    if ($v == $value[$fieldname]) {
                        $newA[$v][] = $value;
                    }
                }  
            }
        }
        return $newA;
    }

        /**
     * @desc arraySort php二维数组排序 按照指定的key 对数组进行排序
     * @param array $arr 将要排序的数组
     * @param string $keys 指定排序的key
     * @param string $type 排序类型 asc | desc
     * @return array
     */
     function arraySort($arr, $keys, $type = 'asc') {
        $keysvalue = $new_array = array();
        foreach ($arr as $k => $v){
            $keysvalue[$k] = $v[$keys];
        }
        $type == 'asc' ? asort($keysvalue) : arsort($keysvalue);
        reset($keysvalue);
        foreach ($keysvalue as $k => $v) {
           $new_array[$k] = $arr[$k];
        }
        return $new_array;
    }	

    function  getweetime($weekstr)
    {   
        $arr  = explode(",",$weekstr);
        $week = date('w',time());
        if (in_array($week,$arr)) {
            return true;
        }
        return false;
    }
}