<?php

include_once __DIR__.'/node_modules/@skylib/config/php-cs-fixer/recommended.php';

$finder = PhpCsFixer\Finder::create()->in([__DIR__.'/utils']);

$config = new PhpCsFixer\Config();

return $config
  ->setFinder($finder)
  ->setIndent('  ')
  ->setLineEnding("\n")

  ->setRules(Recommended::$rules)
;
