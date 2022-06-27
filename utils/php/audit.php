<?php

const RESET = "\033[0m";
const RED = "\033[91m";
const GREEN = "\033[92m";
const YELLOW = "\033[93m";
const WHITE = "\033[97m";

include_once __DIR__.'/api/init.php';

$json = json_decode(stream_get_contents(STDIN), true);

if ($json)
{
  $colors = [
    'info' => RESET,
    'low' => WHITE,
    'moderate' => YELLOW,
    'high' => RED,
    'critical' => RED,
  ];

  $lastColor = RESET;

  $counts = $json['metadata']['vulnerabilities'];

  if ($counts['total'] > 0)
  {
    $descriptions = [];

    foreach ($colors as $name => $color)
    {
      if ($counts[$name] > 0)
      {
        $lastColor = $colors[$name];
        $descriptions[$name] = $colors[$name].$counts[$name].RESET.' '.$name;
      }
    }

    echo $lastColor.$counts['total'].RESET.' vulnerabilities ('.implode(', ', $descriptions).')'.PHP_EOL;
  }
  else
  {
    echo 'Found '.GREEN.'0'.RESET.' vulnerabilities'.PHP_EOL;
  }
}
