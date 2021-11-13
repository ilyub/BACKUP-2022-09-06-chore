<?php

include_once __DIR__.DIRECTORY_SEPARATOR.'api.php';

init('src', 'ts', 'script');
init('src', 'html', 'template');
init('src', 'scss', 'style');

/**
 * Init.
 */
function init(string $dir, string $ext, string $tag) {
  $regexp = '`<'.$tag.'[^<>]*+> \\s*+ (.*) </'.$tag.'[^<>]*+>`isuxDX';
  foreach (scandir($dir) as $basename) {
    if ($basename !== '.' && $basename !== '..') {
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
}
