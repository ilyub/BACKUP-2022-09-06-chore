for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
vendor/bin/phpunit ^
  --cache-result-file=NUL ^
  --coverage-clover=clover.xml ^
  --coverage-html=coverage ^
  tests/TestSuite/%1
pause
