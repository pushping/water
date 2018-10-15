<?php
namespace Xin\Lib\Behavior;

use Phalcon\Mvc\ModelInterface;
use Phalcon\Mvc\Model\Behavior;
use Phalcon\Mvc\Model\BehaviorInterface;
use Phalcon\Mvc\Model\Exception;

class SoftDelete extends Behavior implements BehaviorInterface{
    public function notify($type, ModelInterface $model){
        if($type=='beforeDelete') {
            $attrs=$model->getModelsMetaData()->getAttributes($model);
            if(!in_array('status',$attrs) && !in_array('delete_time',$attrs)) return;

            $model->skipOperation(true);
            $updateModel = clone $model;
            in_array('delete_time',$attrs) && $updateModel->writeAttribute('delete_time', time());
            in_array('status',$attrs) && $updateModel->writeAttribute('status', 'deleted');
            if (!$updateModel->save()) {
                foreach ($updateModel->getMessages() as $msg) {
                    $model->appendMessage($msg);
                }
                return false;
            }
            in_array('delete_time',$attrs) && $model->writeAttribute('delete_time', time());
            in_array('status',$attrs) && $model->writeAttribute('status', 'deleted');
        }
    }
}