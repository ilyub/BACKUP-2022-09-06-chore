pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php "%cd%/../chore/utils/php/clear-dir.php" cache
php "%cd%/../chore/utils/php/clear-dir.php" node_modules/.cache
popd
