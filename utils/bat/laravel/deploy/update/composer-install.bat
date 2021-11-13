pushd .
cd ../..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php "%cd%/../chore/utils/php/deploy.php" %project% composer-install
popd
