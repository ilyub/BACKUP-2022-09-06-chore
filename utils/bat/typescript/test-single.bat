pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
call npm run test --if-present -t %1
popd
