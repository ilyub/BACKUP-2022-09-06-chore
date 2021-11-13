pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php "%cd%/../chore/utils/php/clear-dir.php" dist
start npm run build
popd
