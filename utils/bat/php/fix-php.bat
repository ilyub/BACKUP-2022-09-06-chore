pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call php-cs-fixer fix --verbose
popd
