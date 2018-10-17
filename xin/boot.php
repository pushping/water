<?php
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Mvc\Model\Metadata\Files as MetaDataAdapter;
use Phalcon\Events\Manager;
use Phalcon\Http\Request;
use Phalcon\Http\Response\Cookies;
use Phalcon\Logger;
use Phalcon\Logger\Adapter\File as LoggerAdapter;
use Phalcon\Events\Manager as EventsManager;
use Phalcon\Session\Adapter\Files as Session;

define('ENV', 'DEV'); //本地调成 DEV

define('XIN_DIR', BASE_DIR . 'xin/');
define('CONFIG_DIR', BASE_DIR . 'conf/');
define('RUNTIME_DIR', BASE_DIR . 'var/');

$config = require CONFIG_DIR . 'global.php';
$request = new Request();
define('APP_LEVEL', $config->base->log->level);

require XIN_DIR . 'lib/loader.php';
//使用自定义加载器，强制对类文件名做小写转换
$loader = new \Xin\Lib\Loader();
$loader->registerNamespaces(array(
    'xin' => XIN_DIR,
    'vendor'=> BASE_DIR.'vendor'
));
$loader->registerDirs(array(
    XIN_DIR . 'app/admin/plugins/'
))->register();

$di = new \Phalcon\DI\FactoryDefault();
$di->setShared('config', $config->base);//设置默认的配置
$di->setShared('loader', $loader);

//默认路由设置
$di->set('router', function () use ($di) {
    $router = new \Phalcon\Mvc\Router(false);
    $router->removeExtraSlashes(true);
    $config = $di->get('config');
    
    list($m, $c, $a) = explode('/', $config->defaultRouter);
    $router->setDefaults([
        'namespace' => "Xin\\App\\{$m}\\Controller\\",
        'module' => $m,
        'controller' => $c,
        'action' => $a
    ]);
    return $router;
}, true);


$di->setShared('logger', function () use ($di) {
    $config = $di->get('config');
    $logger = new LoggerAdapter($config->log->path);
    $logger->setLogLevel(APP_LEVEL);
    return $logger;
});

$di->setShared('db', function () use ($di) {
    $config = $di->get('config');
    $dbconfig = $config->database->default;
    $dbclass = '\Phalcon\Db\Adapter\Pdo\\' . $dbconfig->adapter;
    $connection = new $dbclass(array(
        'host' => $dbconfig->host,
        'username' => $dbconfig->username,
        'password' => $dbconfig->password,
        'dbname' => $dbconfig->dbname,
        "options" => array(
            \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES " . $dbconfig->charset,
        )
    ));
    return $connection;
});

$di->setShared('modelsMetadata', function () use ($di) {
    $config = $di->get('config');
    return new MetaDataAdapter(array(
        'metaDataDir' => $config->cacheDir . 'meta/'
    ));
});

$di->setShared('modelsManager', function () use ($di) {
    $config = $di->get('config');
    $modelsManager = new \Xin\Lib\ModelManager();
    $modelsManager->registerNamespaceAlias('_', '\Xin\Model');
    $modelsManager->setModelPrefix($config->database->default->prefix);
    $eventsManager = new Phalcon\Events\Manager();
    $eventsManager->attach('model:beforeValidationOnCreate', function ($event, $model) {
        $attrs=$model->getModelsMetaData()->getAttributes($model);
        in_array('create_time',$attrs) && $model->create_time=time();
        in_array('update_time',$attrs) && $model->update_time=time();
    });
    $eventsManager->attach('model:beforeValidationOnUpdate', function ($event, $model) {
        $attrs=$model->getModelsMetaData()->getAttributes($model);
        in_array('update_time',$attrs) && $model->update_time=time();
    });
    $modelsManager->setEventsManager($eventsManager);
    return $modelsManager;
});

$di->setShared('crypt', function () use ($di) {
    $config = $di->get('config');
    $crypt = new Phalcon\Crypt();
    $crypt->setKey($config->security->salt);
    return $crypt;
});

$di->setShared('viewCache', function () {
    $cache = new \Phalcon\Cache\Backend\File(
        new Phalcon\Cache\Frontend\Output(["lifetime" => 86400]),
        ["cacheDir" => RUNTIME_DIR . "/cache/"]
    );
    return $cache;
});

$di->setShared('session', function () {
    $session = new Session();
    $session->start();
    return $session;
});

$di->set('cookies', function () {
    $cookies = new Cookies();
    //$cookies->useEncryption(false); //禁用加密
    return $cookies;
});

$di->setShared('modelsCache', function () use ($di) {
    $config = $di->get('config');
    $frontCache = new Phalcon\Cache\Frontend\Data([
        'lifetime' => 3600
    ]);
    $cache = new Phalcon\Cache\Backend\File($frontCache, [
        "cacheDir" => $config->cacheDir . "/cache/",
    ]);
    return $cache;
});

$di->setShared('volt', function () use ($di) {
    $volt = new VoltEngine($di->get('view'), $di);
    $config = $di->get('config');
    $volt->setOptions([
        'compiledPath' => $config->cacheDir . 'volt/',
        'compiledSeparator' => '_',
        'compileAlways' => APP_LEVEL == Logger::DEBUG,
        'stat' => true, //开启文件变更判断，需在compileAlways=false时生效
    ]);
    $volt->getCompiler()->addExtension(new \Xin\Lib\ViewExtension($volt->getCompiler()));
    return $volt;
});

$di->set('view', function () use ($di) {
    $view = new View();
    $view->setDI($di);
    $eventsManager = new Manager();
    $eventsManager->attach("view:notFoundView", function ($event, $_view) {
        $_view->getDI()->getLogger()->error($event->getType() . "\t" . var_export($_view->getActiveRenderPath(),1));
    });
    $view->setEventsManager($eventsManager);
    $view->disableLevel(array(
        View::LEVEL_LAYOUT => true,
        View::LEVEL_MAIN_LAYOUT => true,
    ));
    $view->registerEngines(['.html' => 'volt']);
    return $view;
}, true);

set_error_handler(function ($errno, $errstr, $errfile, $errline) use ($di) {
    if (!(error_reporting() & $errno)) {
        return;
    }
    if (in_array($errno, array(1, 4, 16, 64))) {
        $level = Logger::CRITICAL;
    } elseif (in_array($errno, array(32, 128))) {
        $level = Logger::WARNING;
    } elseif ($errno == 8) {
        $level = Logger::NOTICE;
    } else {
        $level = Logger::ERROR;
    }
    $di->getLogger()->log($errstr . ' ' . $errfile . ':' . $errline, $level);
    return true;
});


$di->setShared('application', function() use ($di,$config){
    $application = new \Phalcon\Mvc\Application();
    $application->setDI($di);
    $eventsManager = new Phalcon\Events\Manager();
    $eventsManager->attach('application:beforeStartModule', function ($event, $app, $moduleName) use ($di, $config) {
        $moduleConfig = $config->application[$moduleName];
        if ($moduleConfig && count($moduleConfig) > 0) {
            $_config = $di->get("config");
            $_config = $_config->merge($moduleConfig);
            $di->setShared('config', $_config);
        }

        if (APP_LEVEL == Logger::DEBUG) include CONFIG_DIR . 'debug.php';
        $modelManager=$di->getModelsManager();
        $mergedConfig = $_config ? $_config : $config->base;
        foreach($mergedConfig->module as $k=>$v){
            if($v['disabled']) continue;
            $modelManager->registerNamespaceAlias($k, '\Xin\Module\\'.$k.'\Model');
        }
        //设置链接基础路径及静态资源
        $di->get('url')->setBaseUri($mergedConfig->visualUri);
        if ($mergedConfig->staticUri) {
            $di->get('url')->setStaticBaseUri(rtrim($mergedConfig->staticUri, '/') . '/');
        }
    });
    $eventsManager->attach('application:beforeHandleRequest', function ($event, $app,$dispatcher) use ($di, $config) {
        $module = $dispatcher->getModuleName();
        $controller=$dispatcher->getControllerName();
        //本地应用中不存在时尝试调用模块中控制器
        $handlerClass = $dispatcher->getHandlerClass();
        if (!$di->has($handlerClass) && !class_exists($handlerClass)) {
            $dispatcher->setNamespaceName('Xin\Module\\' . $controller . '\Controller');
            //$dispatcher->setControllerName();
            $di->get('view')->setViewsDir([
                XIN_DIR . 'module/' . $controller . '/view/',
                XIN_DIR . 'app/' .$module.'/view/',
            ]);            
        } else {
            $di->get('view')->setViewsDir([
                XIN_DIR . 'app/' . $module . '/view/',
            ]);
        }
    });
    
    //拦截请求响应为json的，自动组装为json格式返回
    $eventsManager->attach('application:viewRender', function ($event, $application,$view) use ($di) {
        if($_REQUEST['_format']=='json'){
            $vars=$view->getParamsToView();
            $data=['status'=>'ok','data'=>$vars];
            $view->setContent(json_encode($data,JSON_UNESCAPED_UNICODE));       
            return false;
        }
    });
    $application->setEventsManager($eventsManager);
    $apps = [];
    foreach ($config->application as $k => $v) {
        $apps[$k] = [
            'className' => '\\Xin\\App\\' . $k . '\App',
        ];
    }
    $application->registerModules($apps);
    return $application;
});
