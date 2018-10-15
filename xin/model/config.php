<?php

namespace Xin\Model;
use Xin\Model\User;
use Xin\Model\ContainerUser;

class Config extends \Phalcon\Mvc\Model
{
    public static function getValByKey($key, $defaultVal=null){
        static $list;
        if(!isset($list)){
            $cacheKey = 'configlist.php';
            $cache =\Phalcon\Di::getDefault()->getModelsCache();
            $list=$cache->get($cacheKey);
            if(!$list){
                $rs=self::find(['status=1']);
                if($rs){
                    $list=[];
                    foreach($rs->toArray() as $item){
                        $list[$item['name']]=$item['val'];
                    }
                }
                $list && $cache->save($cacheKey,$list);
            }
        }
        return array_key_exists($key,$list)? $list[$key] :$defaultVal ;
    }
}
