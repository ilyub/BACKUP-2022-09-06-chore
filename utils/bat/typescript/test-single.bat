pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
php "%cd%/../chore/utils/php/clear-dir.php" lcov-report
call npm run test -t %1
popd
