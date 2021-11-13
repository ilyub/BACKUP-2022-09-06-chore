pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php "%cd%/../chore/utils/php/vue-to-ts-init.php"
call npm run tsc
php "%cd%/../chore/utils/php/vue-to-ts-done.php"
popd
