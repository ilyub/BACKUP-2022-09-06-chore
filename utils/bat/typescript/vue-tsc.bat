pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run vue-tsc --if-present
popd
