<?php

class EmptyDirs
{
  /**
   * Reports empty dirs.
   */
  public static function do(string $dir): void
  {
    $basenames = array_diff(scandir($dir), static::$ignoreBasenames);

    if (count($basenames))
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
