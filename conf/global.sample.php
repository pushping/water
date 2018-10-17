<?php
error_reporting(E_ERROR);
return new \Phalcon\Config([
    'base' => [
        'database' => [
            'default' => [
                'adapter' => 'Mysql',
                'host' => '',
                'username' => '',
                'password' => '',
                'dbname' => '',
                'charset' => 'utf8',
                'prefix' => 'dc_',
            ],
        ],
        'webtitle'=>'管理平台',
        'website'=>'http://http://water.pushping.cn/',
        'visualUri' => 'index.php?_url=', //配合route的handle工作,如果采用重写，这里就设置基准目录就好.同时用于生成url
        'staticUri' => './admin/', //静态文件路径，可以是绝对地址或相对地址
        'defaultRouter' => 'admin/index/index',
        'fileDir'=>BASE_DIR.'/public/uploads/files',
        'cacheDir' => RUNTIME_DIR . '/data/',
        'log' => [
            'level' => Phalcon\Logger::DEBUG,
            'path' => RUNTIME_DIR . "logs/debug.log",
        ],
        'security'=>[
            'salt'=>'eEAfR[N@DyaIP_2My|:+.u>/6m,$D'
        ],
        'module'=>[
            'user'=>['disabled'=>false],
            'model'=>[],
            'category'=>[],
            'alarm'=>[],
            'area'=>[],
            'device'=>[],
            'order'=>[],
            'linkage'=>[],
            'polling'=>[],
            'person'=>[],
            'parking'=>[],
            'user'=>[],
            'streetlight'=>[
                'url'=>'http://outputcommand:8989/iot/CommandSendTest',
            ],
            'organization'=>[],
            'gallery'=>[
                'uploadDir'=>BASE_DIR.'/public/uploads/',
                'uploadUriPrefix'=>$_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['HTTP_HOST'].($_SERVER['SERVER_PORT']=='80'?'':':'.$_SERVER['SERVER_PORT']),
            ],
            'attachment'=>[
                'salt'=>'My|:+.u>/6m,$DeEAfR[N@DyaIP_2My',
                'uploadUriPrefix'=>$_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['HTTP_HOST'].($_SERVER['SERVER_PORT']=='80'?'':':'.$_SERVER['SERVER_PORT']).dirname($_SERVER['SCRIPT_NAME']).'/uploads/',
                'uploadDir'=>BASE_DIR.'/public/uploads/'
            ],
            'picture'=>[
                'salt'=>'My|:+.u>/6m,$DeEAfR[N@DyaIP_2My',
                'uploadUriPrefix'=>$_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['HTTP_HOST'].($_SERVER['SERVER_PORT']=='80'?'':':'.$_SERVER['SERVER_PORT']).dirname($_SERVER['SCRIPT_NAME']).'/uploads/',
                'uploadDir'=>BASE_DIR.'/public/uploads/',
                'extensions'=>'gif,jpg,jpeg,bmp,png'
            ]
        ],
    ],
    'application' => [
        'api'=>[
            'appId'=>'wx220cfa1c3d558f5b',
            'appSecret'=>'c793cbc71f064deff1faa0b86f24a56f',
            'secret_key'=>'e00bd485dd6f727e04716a01ec0598c1',
        ],
        'home' => [
            'staticUri' => './home/',
        ],
        'admin' =>[
            'defaultRouter' => 'admin/index/index',
            'aepAppKey'=>'FVHwF448alc',
            'aepAppSecret'=>'mQ05Hw8Fw8',
        ],
        'pluginsDir'=>'plugins',
    ]
]);
