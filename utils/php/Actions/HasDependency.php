<?php

namespace Actions;

use Skylib\Config\Assert;

class HasDependency
{
  /**
   * Checks that package has dependency.
   */
  public static function do(string $type, string $dependency): void
  {
    $type = preg_quote($type, '`');
    $dependency = preg_quote($dependency, '`');
    $re = '`"'.$type.'"\s*+:\s*+\{[^{}]*"'.$dependency.'":`isuxDX';

    $contents = Assert::string(file_get_contents('package.json'));

    exit(preg_match($re, $contents) === 1 ? 0 : 1);
  }
}
