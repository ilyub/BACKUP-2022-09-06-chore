<?php

use Skylib\Config\Assert;

include_once __DIR__.'/api/init.php';

$dir = dirname(dirname(dirname(__DIR__)));
Util::rootDir($dir);
EmptyDirs::report($dir);

class EmptyDirs
{
  /**
   * Reports empty dirs.
   */
  public static function report(string $dir): void
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
        static::report($filename);
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
    '.scannerwork',
    '.ssh',
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
