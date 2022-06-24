pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run sonar --if-present
popd
