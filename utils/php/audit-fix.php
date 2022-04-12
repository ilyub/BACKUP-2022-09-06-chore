<?php

include_once __DIR__.'/api.php';

$json = json_decode(stream_get_contents(STDIN), true);

if ($json) {
  echo 'Added: '.$json['added'].PHP_EOL;
  echo 'Removed: '.$json['removed'].PHP_EOL;
  echo 'Changed: '.$json['changed'].PHP_EOL;
  echo 'Audited: '.$json['audited'].PHP_EOL;
}
