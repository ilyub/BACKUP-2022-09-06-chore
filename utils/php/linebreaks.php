<?php

include_once __DIR__.DIRECTORY_SEPARATOR.'api.php';

$dir = dirname(dirname(dirname(__DIR__)));

if (
  file_exists($dir.DIRECTORY_SEPARATOR.'.npm') &&
  file_exists($dir.DIRECTORY_SEPARATOR.'.ssh')
) {
  fix($dir);
} else {
  throw new Exception('Invalid directory: '.$dir);
}

/**
 * Fixes linebreaks.
 */
function fix(string $dir): void {
  $ignoreBasenames = [
    '.git',
    '.npm',
    '.php-cs-fixer.cache',
    '.repro',
    '.scannerwork',
    '.ssh',
    'cache',
    'composer.lock',
    'coverage',
    'dist',
    'docs',
    'es',
    'fix-pouchdb',
    'id_rsa',
    'id_rsa.pub',
    'lcov.info',
    'lcov-report',
    'node_modules',
    'out',
    'storage',
    'vendor'
  ];

  $ignoreExts = [
    'ico',
    'phar',
    'png',
    'svg',
    'vsix'
  ];

  $fixBasenames = [
    '.browserslistrc',
    '.doxygen',
    '.editorconfig',
    '.env',
    '.env.example',
    '.env.production',
    '.env.testing',
    '.eslintignore',
    '.gitignore',
    '.htaccess',
    '.npmignore',
    'artisan',
    'commit-msg',
    'post-commit',
    'pre-commit',
    'sonar-project.properties'
  ];

  $fixExts = [
    'bat',
    'code-workspace',
    'html',
    'js',
    'json',
    'md',
    'php',
    'scss',
    'ts',
    'txt',
    'vue',
    'xml'
  ];

  foreach (getDir($dir) as $basename) {
    if (in_array($basename, $ignoreBasenames)) {
      // Ignore
    } else {
      $filename = $dir.DIRECTORY_SEPARATOR.$basename;
      if (is_dir($filename)) {
        fix($filename);
      } else {
        $ext = pathinfo($basename, PATHINFO_EXTENSION);
        if (in_array($ext, $ignoreExts)) {
          // Ignore
        } elseif (in_array($basename, $fixBasenames) || in_array($ext, $fixExts)) {
          $contents = file_get_contents($filename);
          $contents = str_replace("\r\n", "\n", $contents);
          file_put_contents($filename, $contents);
        } else {
          echo 'Unexpected: '.$filename.PHP_EOL;
        }
      }
    }
  }
}
