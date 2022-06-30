<?php

namespace Actions;

use Skylib\Config\Assert;

class EmptyDirs
{
  /**
   * Reports empty dirs.
   */
  public static function do(string $dir): void
  {
    $basenames = array_diff(Assert::strings(scandir($dir)), static::$ignoreBasenames);

    if (count($basenames) === 0)
    {
      echo $dir.PHP_EOL;
    }

    foreach ($basenames as $basename)
    {
      $filename = $dir.'/'.$basename;

      if (is_dir($filename))
      {
        static::do($filename);
      }
    }
  }

  /**
   * @var array<int,string>
   */
  protected static $ignoreBasenames = [
    '.',
    '..',
    '.git',
    '.npm',
    '.repro',
    '.scannerwork',
    '.ssh',
    'backup',
    'cache',
    'coverage',
    'dist',
    'docs',
    'es',
    'lcov-report',
    'node_modules',
    'out',
    'vendor',
  ];
}
