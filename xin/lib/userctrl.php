<?php
namespace Xin\Lib;

use Phalcon\Di;


abstract class UserCtrl
{
    protected $_id, $_params = array(), $_renderPath,$_defaultSettings=array();

    final public function __construct($id = null)
    {
        static $incr = 1;
        ++$incr;
        if (isset($id)) {
            $this->_id = $id;
        } else {
            $this->_id = 'UserCtrl_' . get_class($this) . '_' . $incr;
        }
        $this->_renderPath = 'partial/' . strtolower(str_replace(array('Xin\\', 'App\\', 'Admin\\', 'Ctrl\\'), '', get_class($this)));
        $this->init();
    }

    protected abstract function init();

    public function setAttrib($key, $val)
    {
        $this->_params[$key] = $val;
        return $this;
    }

    public function setAttribs($params)
    {
        is_Array($params) && $this->_params = array_merge($this->_params, $params);
        return $this;
    }

    public function getAttrib($key)
    {
        return $this->_params[$key];
    }

    public function id()
    {
        return $this->_id;
    }

    protected function beforeOutput()
    {
    }

    protected function afterOutput()
    {
    }

    /**
     * @throws \Exception
     */
    public function output()
    {
        $this->beforeOutput();   
        $view = Di::getDefault()->get('view');     
        $view->partial('partial/' . strtolower(basename(str_replace('\\','/',get_class($this)))), $this->_params);
        $this->afterOutput();
    }
}
