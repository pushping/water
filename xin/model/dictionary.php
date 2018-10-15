<?php

namespace Xin\Model;

use Xin\Lib\ModelBase;

class Dictionary extends ModelBase
{

    public function get_device_status($name)
    {
        $list = self::query()->columns("title,extra,val")
                             ->where("status=1  and name='".$name."'")
                             ->execute();
        $data = [];
        foreach ($list as $k => $v) {
            $data[$v['val']] = [$v['title'],$v['extra']];
        }
        return $data;
    }

    public function get_all_dic(){
        $list = self::find('1=1');
        return $list;
    }
}
