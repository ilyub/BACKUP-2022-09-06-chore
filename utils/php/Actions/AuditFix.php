<?php

namespace Actions;

use Skylib\Config\Assert;
use Skylib\Config\Unknown;

class AuditFix
{
  /**
   * Formats audit fix output.
   */
  public static function do(): void
  {
    $str = Assert::string(stream_get_contents(STDIN));

    $json = Unknown\Assert::array(json_decode($str, true));

    echo 'Added: '.$json['added'].PHP_EOL;
    echo 'Removed: '.$json['removed'].PHP_EOL;
    echo 'Changed: '.$json['changed'].PHP_EOL;
    echo 'Audited: '.$json['audited'].PHP_EOL;
  }
}
