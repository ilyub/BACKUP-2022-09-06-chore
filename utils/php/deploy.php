<?php

include_once __DIR__.'/autoload.php';

$dir = dirname(dirname(dirname(__DIR__)));
Api\Util::rootDir($dir);
$deploy = new Actions\Deploy($argv[1], $dir);
$deploy->do($argv[2], $argv[3]);
