<?php

namespace Xin\Module\User\Model;
use Xin\Lib\Utils;

class User extends \Xin\Lib\ModelBase
{
    /**
     * @return Model
     */
    public function getExtends(){
        switch ($this->user_type){
            case self::TYPE_ADMIN:
                $this->hasOne('id','Xin\Module\User\Model\User','uid', array('alias' => 'UserAdmin'));
                return $this->getUserAdmin();
                break;
        }
    }

    /**
     * @return Model
     */
    public function getExtendModel(){
        switch ($this->user_type){
            case self::TYPE_ADMIN:
                return new UserAdmin();
                break;
        }
    }
}

