<?php

namespace Actions;

use Skylib\Config\Assert;
use Skylib\Config\Unknown;

class Audit
{
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

  protected const GREEN = "\033[92m";
  protected const RED = "\033[91m";
  protected const RESET = "\033[0m";
  protected const WHITE = "\033[97m";
  protected const YELLOW = "\033[93m";
}
