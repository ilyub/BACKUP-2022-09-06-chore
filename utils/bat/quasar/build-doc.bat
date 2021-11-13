pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php "%cd%/../chore/utils/php/clear-dir.php" docs
php "%cd%/../chore/utils/php/vue-to-ts-init.php"
call npm run build-doc
php "%cd%/../chore/utils/php/vue-to-ts-done.php"
popd
