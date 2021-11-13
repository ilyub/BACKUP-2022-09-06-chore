<?php

include_once __DIR__.DIRECTORY_SEPARATOR.'api.php';

if (strlen($argv[1]) === 0) {
  throw new Exception('Missing directory name');
}

clearDir($argv[1], ['_config.yml']);
