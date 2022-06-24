pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run package-json-lint --if-present
popd
