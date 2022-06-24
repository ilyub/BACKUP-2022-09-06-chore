pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run delete-tags --if-present
popd
