pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run config-lint --if-present
popd
