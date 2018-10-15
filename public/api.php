<?php
define('BASE_DIR', dirname(__DIR__) . '/');
require BASE_DIR.'xin/boot.php';

/**
 * @var $router \Phalcon\Mvc\Router
 */
$router=$di->getRouter();
$router->clear();
$router->setDefaults([
    'namespace' => "Xin\App\Api\Controller\\",
    'module' => 'api'
]);
$router->add('/([\w_]+)/{id:[0-9]+}/([\w_]+)',["controller" => 1,"action" => 3]);
$router->addGet('/([\w_]+)/([\w_]+)',["controller" => 1,"action" => 2]);
$router->addGet('/([\w_]+)/{id:[0-9]+}/([\w_]+)',["controller" => 1,"action" => 3]);

$router->addGet('/([\w_]+token)/{token:[\w\-]+}',["controller" => 1,"action" => 'query']);
$router->addGet('/([\w_]+)/{id:[0-9]+}',["controller" => 1,"action" => 'query']);
$router->addDelete('/([\w_]+)/{id:[0-9]+}',["controller" => 1,"action" => 'delete']);
$router->addPost('/([\w_]+)',["controller" => 1,"action" => 'create']);
$router->addPost('/([\w_]+)/([\w_]+)',["controller" => 1,"action" => 2]);
$router->addPut('/([\w_]+)/{id:[0-9]+}',["controller" => 1,"action" => 'update']);
$router->addGet('/([\w_]+)',["controller" => 1,"action" => 'list']);
$router->addHead('/([\w_]+)',["controller" => 1,"action" => 'exists']);

try {
    $resp = $di->getApplication()->handle();
}catch(\InvalidArgumentException $e){
    $resp = $di->get('response');
    $data=[
        'status'=>'error',
        'message'=>'参数无效或格式不正确.'.$e->getMessage()
    ];
    $resp->setJsonContent($data,JSON_UNESCAPED_UNICODE);
    $resp->setStatusCode(400);
} catch (\Exception $e) {
    $di->getLogger()->critical($e->getMessage() . ":" . $e->getTraceAsString());
    $resp = $di->get('response');
    $data=[
        'status'=>'error',
        'message'=>'服务端执行异常'.(APP_LEVEL==Phalcon\Logger::DEBUG?', '.$e->getMessage():'')
    ];
    $resp->setJsonContent($data,JSON_UNESCAPED_UNICODE);
    $resp->setStatusCode(500);
}

echo $resp->getContent();