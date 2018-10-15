<?php

use Xin\Lib\Utils;

define('BASE_DIR', dirname(__DIR__) . '/');
require BASE_DIR . 'xin/boot.php';
include BASE_DIR . 'xin/lib/PHPExcel.php';
$route=$di->get('router');
$route->add("#^([\\w_]+)/([\\w_]+)/([\\w_]+)$#", [
        'namespace'=>1,
        'module' => 1,
        "controller" => 2,
        "action" => 3,
    ])->convert('namespace', function ($ns) {
        return 'Xin\\App\\' . $ns . '\Controller\\';
    });
$route->add("#^([^/]+)/([^/]+)$#", [
        "controller" => 1,
        "action" => 2,
    ]);

try {
    echo $di->getApplication()->handle()->getContent();
} catch (\Exception $e) {
    $di->getLogger()->critical($e->getMessage() . ":" . $e->getTraceAsString());
    echo $e->getMessage();
}
