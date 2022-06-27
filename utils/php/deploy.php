<?php

include_once __DIR__.'/api/init.php';

Util::rootDir();
$job = new Deploy($argv[1]);
$job->do($argv[2], $argv[3]);
