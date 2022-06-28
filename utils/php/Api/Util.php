<?php

namespace Api;

use Skylib\Config\BaseException;

class Util
{
  /**
   * Checks directory.
   */
  public static function rootDir(string $dir): void
  {
    if (file_exists($dir.'/.npm') && file_exists($dir.'/.ssh'))
    {
      // In root dir
    }
    else
    {
      throw new BaseException('Not in root dir: '.$dir);
    }
  }
}
