<?php
namespace Xin\Module\User\Model;
use Phalcon\Mvc\Model;

class UserToken extends Model
{


    public function initialize()
    {
        $this->belongsTo('uid', '\Xin\Model\User', 'id', array(
            'alias' => 'user'
        ));
    }

}
