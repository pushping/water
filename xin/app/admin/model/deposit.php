<?php

namespace Xin\App\Admin\Model;
use Xin\Lib\ModelBase;

class Deposit extends ModelBase
{
    public function getSource()
    {
        return 'dc_deposit';
    }
}