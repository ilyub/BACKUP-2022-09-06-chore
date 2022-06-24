pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm test --if-present
popd
