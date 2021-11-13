<?php

include_once 'node_modules/@skylib/config/src/php-cs-rules.php';

$finder = PhpCsFixer\Finder::create()->in([__DIR__.'/utils/php']);

return PhpCsFixer\Config::create()
  ->setFinder($finder)
  ->setIndent('  ')
  ->setLineEnding("\n")
  ->setRules($phpCsRules);
