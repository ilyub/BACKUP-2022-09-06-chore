<?php

namespace Actions;

use Skylib\Config\Assert;
use Skylib\Config\Unknown;

class Audit
{
  public const GREEN = "\033[92m";
  public const RED = "\033[91m";
  public const RESET = "\033[0m";
  public const WHITE = "\033[97m";
  public const YELLOW = "\033[93m";

  /**
   * Formats audit output.
   */
  public static function do(): void
  {
    $str = Assert::string(stream_get_contents(STDIN));

    $json = Unknown\Assert::array(json_decode($str, true));

    $metadata = Unknown\Assert::array($json['metadata']);

    $vulnerabilities = Unknown\Assert::array($metadata['vulnerabilities']);

    $colors = [
      'info' => static::RESET,
      'low' => static::WHITE,
      'moderate' => static::YELLOW,
      'high' => static::RED,
      'critical' => static::RED,
    ];

    $lastColor = static::RESET;

    if ($vulnerabilities['total'] > 0)
    {
      $descriptions = [];

      foreach ($colors as $name => $color)
      {
        if ($vulnerabilities[$name] > 0)
        {
          $lastColor = $color;
          $descriptions[$name] = $color.$vulnerabilities[$name].
            static::RESET.' '.$name;
        }
      }

      echo $lastColor.$vulnerabilities['total'].
        static::RESET.' vulnerabilities ('.implode(', ', $descriptions).')'.PHP_EOL;
    }
    else
    {
      echo 'found '.
        static::GREEN.'0'.
        static::RESET.' vulnerabilities'.PHP_EOL;
    }
  }
}
