pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
if "%2" == "" (
  echo Missing parameter 2
  pause
  exit
)
vendor/bin/phpunit ^
  --cache-result-file=NUL ^
  --coverage-clover=clover.xml ^
  --coverage-html=coverage ^
  --filter=%2 ^
  tests/TestSuite/%1
popd
