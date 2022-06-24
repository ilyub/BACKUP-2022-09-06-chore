pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run php-cs-fixer --if-present
popd
