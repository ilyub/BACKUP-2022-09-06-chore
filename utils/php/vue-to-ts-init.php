<?php

include_once __DIR__.DIRECTORY_SEPARATOR.'api.php';

init('src', 'tmp.ts', 'script');
init('src', 'tmp.html', 'template');
init('src', 'tmp.scss', 'style');

/**
 * Init.
 */
function init(string $dir, string $ext, string $tag): void {
  $regexp = '`<'.$tag.'[^<>]*+> \\s*+ (.*) </'.$tag.'[^<>]*+>`isuxDX';
  foreach (getDir($dir) as $basename) {
    $filename = $dir.'/'.$basename;
    if (is_dir($filename)) {
      init($filename, $ext, $tag);
    } elseif (pathinfo($basename, PATHINFO_EXTENSION) === 'vue') {
      $tmp = swapExtension($filename, 'vue', $ext);
      $contents = file_get_contents($filename);
      if (preg_match($regexp, $contents, $matches)) {
        file_put_contents($tmp, $matches[1]);
      }
    }
  }
}
