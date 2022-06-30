@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
vendor/bin/phpunit ^
  --cache-result-file=NUL ^
  --coverage-clover=clover.xml ^
  --coverage-html=coverage
pause
