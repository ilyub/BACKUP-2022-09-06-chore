<?php

use Skylib\Config\Assert;
use Skylib\Config\Unknown;

const RESET = "\033[0m";
const RED = "\033[91m";
const GREEN = "\033[92m";
const YELLOW = "\033[93m";
const WHITE = "\033[97m";

include_once __DIR__.'/api/init.php';

$str = Assert::string(stream_get_contents(STDIN));

$json = Unknown\Assert::array(json_decode($str, true));

$metadata = Unknown\Assert::array($json['metadata']);

$vulnerabilities = Unknown\Assert::array($metadata['vulnerabilities']);

$colors = [
  'info' => RESET,
  'low' => WHITE,
  'moderate' => YELLOW,
  'high' => RED,
  'critical' => RED,
];

$lastColor = RESET;

if ($vulnerabilities['total'] > 0)
{
  $descriptions = [];

  foreach ($colors as $name => $color)
  {
    if ($vulnerabilities[$name] > 0)
    {
      $lastColor = $colors[$name];
      $descriptions[$name] = $colors[$name].$vulnerabilities[$name].RESET.' '.$name;
    }
  }

  echo $lastColor.$vulnerabilities['total'].RESET.' vulnerabilities ('.implode(', ', $descriptions).')'.PHP_EOL;
}
else
{
  echo 'Found '.GREEN.'0'.RESET.' vulnerabilities'.PHP_EOL;
}
