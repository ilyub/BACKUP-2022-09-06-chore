<?php

set_error_handler('errorHandler');

/**
 * Clears directory.
 */
function clearDir(string $dir, array $ignore = [], $exists = false): void
{
  if ($exists || file_exists($dir))
  {
    foreach (getDir($dir, $ignore) as $basename)
    {
      $filename = $dir.'/'.$basename;
      if (is_dir($filename))
      {
        clearDir($filename, [], true);
        rmdir($filename);
      }
      else
      {
        unlink($dir.'/'.$basename);
      }
    }
  }
}

/**
 * Handles error.
 */
function errorHandler(int $errno, string $errstr): void
{
  throw new Exception('Error '.$errno.': '.$errstr);
}

/**
 * Scans directory.
 */
function getDir(string $dir, array $ignore = []): array
{
  return array_diff(scandir($dir), ['.', '..', ...$ignore]);
}

/**
 * Swaps extensions.
 */
function swapExtension(string $filename, string $from, string $to): string
{
  return dirname($filename).'/'.basename($filename, '.'.$from).'.'.$to;
}
