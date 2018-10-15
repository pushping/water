<?php
namespace Xin\App\Admin\Model;
use Xin\Lib\ModelBase;

class DeviceType extends ModelBase
{
    public function getSource()
    {
        return 'dc_device_type';
    }
}