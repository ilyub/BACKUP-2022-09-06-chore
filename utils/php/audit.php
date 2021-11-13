<?php

const RESET = "\033[0m";
const RED = "\033[91m";
const GREEN = "\033[92m";
const YELLOW = "\033[93m";
const WHITE = "\033[97m";

include_once __DIR__.DIRECTORY_SEPARATOR.'api.php';

$json = json_decode(stream_get_contents(STDIN), true);

if ($json) {
  $color = RESET;

  $colors = [
    'info' => RESET,
    'low' => WHITE,
    'moderate' => YELLOW,
    'high' => RED,
    'critical' => RED
  ];

  $counts = $json['metadata']['vulnerabilities'];

  if ($counts['total'] > 0) {
    $parts = [];

    add('info');
    add('low');
    add('moderate');
    add('high');
    add('critical');

    echo $color.$counts['total'].RESET.' vulnerabilities ('.implode(', ', $parts).')'.PHP_EOL;
  } else {
    echo 'found '.GREEN.'0'.RESET.' vulnerabilities'.PHP_EOL;
  }
}

/**
 * Adds part.
 */
function add(string $name): void {
  global $color, $colors, $counts, $parts;

  if ($counts[$name] > 0) {
    $color = $colors[$name];
    $parts[$name] = $colors[$name].$counts[$name].RESET.' '.$name;
  }
}
