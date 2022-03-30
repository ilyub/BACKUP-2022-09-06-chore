<?php

include_once __DIR__.DIRECTORY_SEPARATOR.'api.php';

$dir = dirname(dirname(dirname(__DIR__)));

if (
  file_exists($dir.DIRECTORY_SEPARATOR.'.npm')
  && file_exists($dir.DIRECTORY_SEPARATOR.'.ssh')
) {
  report($dir);
} else {
  throw new Exception('Invalid directory: '.$dir);
}

/**
 * Fixes linebreaks.
 */
function report(string $dir): void
{
  $empty = true;

  foreach (getDir($dir, ['.git', 'cache', 'node_modules', 'vendor']) as $basename) {
    $empty = false;
    $filename = $dir.DIRECTORY_SEPARATOR.$basename;
    if (is_dir($filename)) {
      report($filename);
    }
  }

  if ($empty) {
    echo $dir.PHP_EOL;
  }
}
