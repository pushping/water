<?php

namespace Xin\Lib;

use Phalcon\Di;


class SqlHelper
{
    /**
     * SQLlike语句的转义
     * @param string $str
     * @return string
     */
    public static function escapeLike($str){
        return  strtr($str,array('%'=>'\%','_'=>'\_'));
    }

    /*
    public static function array2In($data, $field, $symbol='IN', $dbAdapter=null)
    {
        if (!is_array($data) || count($data) == 0) return '1=1';
        switch ($symbol) {
            case 'IN':
                $sql[] = $field . ' IN (';
                foreach ($data as $d) {
                    $sql[] = "'" . ($dbAdapter ? $dbAdapter->escapeString($d) : addslashes($d)) . "',";
                }
                return substr(implode('', $sql), 0, -1) . ')';
        }
    }
*/
    /**
     * @param $page
     * @param $pagesize
     * @return string
     */
    public static function limit($page=null,$pagesize=null){
        list($offset,$limit)=Utils::offset($page,$pagesize);

        return ' LIMIT '.$offset.','.$limit;
    }
}