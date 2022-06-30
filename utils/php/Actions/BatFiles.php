<?php

namespace Actions;

use Skylib\Config\Assert;

class BatFiles
{
  /**
   * Reports empty dirs.
   */
  public static function do(string $dir): void
  {
    $basenames = array_diff(Assert::strings(scandir($dir)), static::$ignoreBasenames);

    foreach ($basenames as $basename)
    {
      $filename = $dir.'/'.$basename;

      if (is_dir($filename))
      {
        static::do($filename);
      }
      elseif (pathinfo($filename, PATHINFO_EXTENSION) === 'bat')
      {
        $contents = Assert::string(file_get_contents($filename));

        if (str_starts_with($contents, "@echo off\n"))
        {
          // Valid
        }
        else
        {
          echo 'Invalid: '.$filename."\n";
        }
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
