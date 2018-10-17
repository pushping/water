<?php
namespace Xin\Lib\Ctrl;

class Pagination extends \Xin\Lib\UserCtrl
{
    protected function init()
    {
        $this->_params = array(
            'pageIndex' => 1,
            'recordCount' => 0,
            'pageSize' => 10,
            'urlFormat' => ''
        );
        if ($_GET['page']) $this->pageIndex($_GET['page']);
    }

    public function pageIndex($pageIndex = null)
    {
        if (isset($pageIndex)) {
            $pageIndex = intval($pageIndex);
            $this->_params['pageIndex'] = $pageIndex < 1 ? 1 : $pageIndex;
        } else {
            return $this->_params['pageIndex'];
        }
    }

    public function recordCount($recordCount = null)
    {
        if (isset($recordCount)) {
            $recordCount=intval($recordCount);
            $this->_params['recordCount'] = $recordCount> 0 ? $recordCount : 0;
            
        } else {
            return $this->_params['recordCount'];
        };
    }

    public function pageSize($pageSize = null)
    {
        if (isset($pageSize)) {
            $pageSize=intval($pageSize);
            $this->_params['pageSize'] = $pageSize > 0 ? $pageSize : $this->_pageSize;
        } else {
            return $this->_params['pageSize'];
        }
    }

    public function urlFormat($urlFormat = null)
    {
        if (isset($urlFormat)) {
            $this->_params['urlFormat'] = $urlFormat;
        } else {
            return $this->_params['urlFormat'];
        }
    }

    public function getOffset()
    {
        return ($this->pageIndex() - 1) * $this->pageSize();
    }


    public function pageCount()
    {
        return ceil($this->_params['recordCount'] / $this->_params['pageSize']);
    }


    protected function beforeOutput()
    {
        if (empty($this->_params['urlFormat'])) {
            $url_format = $_SERVER['REQUEST_URI'];

            $i = strpos($url_format, '?');
            if ($i === false) {
                $url_format .= '?page=@PAGE@';
            } else {
                $url_format = preg_replace('/([\?|&])page=\d+/', '', $url_format);
                $url_format .= '&page=@PAGE@';
            }
            if (dirname($_SERVER['SCRIPT_NAME'])=='/') {
                $url_format = substr($url_format,1);
            }
            $this->_params['urlFormat'] = $url_format;
        }
        $this->_params['pageCount'] = $this->pageCount();
    }
}
