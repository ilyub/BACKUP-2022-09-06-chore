<?php

include_once __DIR__.DIRECTORY_SEPARATOR.'api.php';

done('src', 'tmp.ts', 'script');
done('src', 'tmp.html', 'template');
done('src', 'tmp.scss', 'style');

/**
 * Done.
 */
function done(string $dir, string $ext, string $tag): void {
  $regexp = '`<'.$tag.'[^<>]*+> \\s*+ (.*) </'.$tag.'[^<>]*+>`isuxDX';
  foreach (getDir($dir) as $basename) {
    $filename = $dir.'/'.$basename;
    if (is_dir($filename)) {
      done($filename, $ext, $tag);
    } elseif (pathinfo($basename, PATHINFO_EXTENSION) === 'vue') {
      $tmp = swapExtension($filename, 'vue', $ext);
      $contents = file_get_contents($filename);
      if (preg_match($regexp, $contents, $matches)) {
        $search = $matches[1];
        $replace = file_get_contents($tmp);
        $contents = str_replace($search, $replace, $contents);
        file_put_contents($filename, $contents);
        unlink($tmp);
      }
    }
  }
}
