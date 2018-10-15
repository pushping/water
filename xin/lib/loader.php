<?php
namespace Xin\Lib;

class Loader extends \Phalcon\Loader{
    public function autoLoad($className){
        parent::autoLoad(strtolower($className));
    }
}