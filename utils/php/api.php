<?php

set_error_handler('errorHandler');

/**
 * Clears directory.
 */
function clearDir(string $dir, array $ignore = [], $exists = false): void {
  $ignore = ['.', '..', ...$ignore];

  $exists = $exists || file_exists($dir);

  if ($exists) {
    foreach (scandir($dir) as $basename) {
      if (in_array($basename, $ignore)) {
        // Ignore
      } else {
        $filename = $dir.DIRECTORY_SEPARATOR.$basename;
        if (is_dir($filename)) {
          clearDir($filename, [], true);
          rmdir($filename);
        } else {
          unlink($dir.DIRECTORY_SEPARATOR.$basename);
        }
      }
    }
  }
}

/**
 * Handles error.
 */
function errorHandler(int $errno, string $errstr): void {
  throw new Exception('Error '.$errno.': '.$errstr);
}

/**
 * Swaps extensions.
 */
function swapExtension(string $filename, string $from, string $to) {
  return dirname($filename).'/'.basename($filename, '.'.$from).'.'.$to;
}
