<?php

namespace Xin\Lib;

use Phalcon\Logger;
use Phalcon\Session\Adapter\Files as Session;
use Xin\Model\Config;

class HttpClient
{

    protected $_headers = [
        'accept' => 'application/json',
        'accept-charset' => 'utf-8',
        'content-type' => 'application/json',
    ];
    protected $_timeout = 10;
    protected $_resp = [];
    protected $_auth;


    protected function _getHeaders($headers)
    {
        $arr = [];
        foreach ($headers as $k => $v) {
            $arr[] = $k . ': ' . $v;
        }
        return $arr;
    }

    public static function instance(){
        static $client;
        if(!isset($client)) {
            $client = new HttpClient();
        }
        return $client;
    }

    public function setHeader($key, $val)
    {
        $this->_headers[$key] = $val;
    }
    public function setTimeout($val){
        $this->_timeout=intval($val);
    }

    public function request($url, $params=null, $headers=null, $method = 'GET', $returnHeader = 0)
    {
        $headers =$this->_getHeaders( $headers? $headers:$this->_headers);
        $ci = curl_init();
        curl_setopt($ci, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
        $returnHeader && curl_setopt($ci, CURLOPT_HEADER, TRUE);
        curl_setopt($ci, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ci, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ci, CURLOPT_TIMEOUT, $this->_timeout);
        
        curl_setopt($ci, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
        curl_setopt($ci, CURLOPT_SSL_VERIFYHOST, true);  // 从证书中检查SSL加密算法是否存在

        if($this->_auth){
            curl_setopt($ci, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
            curl_setopt($ci, CURLOPT_USERPWD, $this->_auth);
        }

        switch ($method) {
            case 'POST':
                curl_setopt($ci, CURLOPT_POST, TRUE);
                curl_setopt($ci, CURLOPT_POSTFIELDS, $params); 
                break;
            case 'PUT':
                curl_setopt($ci, CURLOPT_CUSTOMREQUEST, "PUT");
                curl_setopt($ci, CURLOPT_POSTFIELDS, $params);
                break;
            case 'PATCH':
                curl_setopt($ci, CURLOPT_CUSTOMREQUEST, "PATCH");
                curl_setopt($ci, CURLOPT_POSTFIELDS, $params);
                break;
            case 'DELETE':
                curl_setopt($ci, CURLOPT_CUSTOMREQUEST, "DELETE");
                break;
            case 'OPTION':
                curl_setopt($ci, CURLOPT_CUSTOMREQUEST, "OPTION");
                break;
            case 'GET':
                if($params){
                    $url.=strpos($url,'?')===false?'?':'&';
                    $url.= is_array($params)?http_build_query($params):$params;
                }
                break;
        }
        //过滤IP
        $ipArr=array();
        $ipArr[]='127.0.0.1:9200';
        $ipArr[]=rtrim(Config::getValByKey('ELASTICSEARCH_HOST'),'/');
        $flag=0;
        foreach($ipArr as $v){
            if(strpos($url,$v)!==false){
                $flag=1;
                break;
            }
        }
        if($flag===0){
            $session = new Session();
            if($session->get('apitoken')){
                $url.=strpos($url,'?')===false?'?':'&';
                $url .= 'apitoken='.$session->get('apitoken');
            }
        }
        curl_setopt($ci, CURLOPT_URL, $url);
        if(APP_LEVEL==Logger::DEBUG){
            curl_setopt($ci, CURLINFO_HEADER_OUT, true);
        }

        $response = curl_exec($ci);

        if (FALSE === $response) {
            \Phalcon\Di::getDefault()->getLogger()->error("request url '{$url}' error. " . curl_error($ci));
            return false;
        }
        $this->_resp['httpcode'] = curl_getinfo($ci, CURLINFO_HTTP_CODE);
        \Phalcon\Di::getDefault()->getLogger()->debug(curl_getinfo($ci, CURLINFO_HEADER_OUT).($method!='GET'?$params:'')."\n\n".$response);
        curl_close($ci);
        return $response;
    }

    public function getCode(){
        return $this->_resp['httpcode'];
    }

    public function setBaseAuth($user,$pwd){
        $this->_auth=$user.':'.$pwd;
    }

    public function post($url, $params=null, $headers=null)
    {
        return $this->request($url, $params, $headers, 'POST');
    }

    public function postform($url,$parmas=null){
        return $this->request($url, $parmas, ['Content-Type'=>'application/x-www-form-urlencoded'], 'POST');

    }

    public function get($url, $params=null, $headers=null)
    {
        return $this->request($url, $params, $headers, 'GET');
    }

    public function put($url, $params=null, $headers=null)
    {
        return $this->request($url, $params, $headers, 'PUT');
    }

    public function patch($url, $params=null, $headers=null)
    {
        return $this->request($url, $params, $headers, 'PATCH');
    }

    public function delete($url, $params=null, $headers=null)
    {
        return $this->request($url, $params=null, $headers, 'DELETE');
    }

    public function option($url, $params=null, $headers=null)
    {
        return $this->request($url, $params, $headers, 'OPTION');
    }
}