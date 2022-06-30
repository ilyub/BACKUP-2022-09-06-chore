<?php

include_once __DIR__.'/autoload.php';

$dir = dirname(dirname(dirname(__DIR__)));
Api\Util::rootDir($dir);
Actions\Linebreaks::do($dir);
