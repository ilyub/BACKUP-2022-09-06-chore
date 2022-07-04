<?php

use Skylib\Config\Assert;

include_once __DIR__.'/autoload.php';

Actions\HasDependency::do(Assert::string($argv[1]), Assert::string($argv[2]));
