pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run browserslist --if-present
popd
