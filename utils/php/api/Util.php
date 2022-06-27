<?php

class Util
{
  public static function rootDir()
  {
    define('ROOT_DIR', dirname(dirname(dirname(dirname(__DIR__)))));

    if (file_exists(ROOT_DIR.'/.npm') && file_exists(ROOT_DIR.'/.ssh'))
    {
      // In root dir
    }
    else
    {
      throw new Exception('Not in root dir: '.ROOT_DIR);
    }
  }
}
