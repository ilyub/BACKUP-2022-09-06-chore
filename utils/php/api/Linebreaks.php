<?php

class Linebreaks
{
  /**
   * Fixes linebreaks.
   */
  public static function do(string $dir): void
  {
    $basenames = array_diff(scandir($dir), static::$ignoreBasenames);

    foreach ($basenames as $basename)
    {
      $filename = $dir.'/'.$basename;

      if (is_dir($filename))
      {
        static::do($filename);
      }
      else
      {
        $ext = pathinfo($basename, PATHINFO_EXTENSION);

        if (in_array($ext, static::$ignoreExts))
        {
          // Ignore
        }
        elseif (in_array($basename, static::$fixBasenames) || in_array($ext, static::$fixExts))
        {
          $contents = file_get_contents($filename);
          $contents = str_replace("\r\n", "\n", $contents);
          file_put_contents($filename, $contents);
        }
        else
        {
          echo 'Unexpected: '.$filename.PHP_EOL;
        }
      }
    }
  }

  protected static $fixBasenames = [
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
    'artisan',
    'commit-msg',
    'post-commit',
    'pre-commit',
    'sonar-project.properties',
  ];

  protected static $fixExts = [
    'bat',
    'code-workspace',
    'html',
    'js',
    'json',
    'md',
    'php',
    'scss',
    'sh',
    'ts',
    'txt',
    'vue',
    'xml',
    'yml',
  ];

  protected static $ignoreBasenames = [
    '.',
    '..',
    '.git',
    '.npm',
    '.php-cs-fixer.cache',
    '.scannerwork',
    '.ssh',
    'cache',
    'composer.lock',
    'coverage',
    'dist',
    'docs',
    'es',
    'lcov.info',
    'lcov-report',
    'node_modules',
    'out',
    'vendor',
  ];

  protected static $ignoreExts = [
    'ico',
    'phar',
    'log',
    'png',
    'svg',
    'vsix',
  ];
}
