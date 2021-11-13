pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php artisan inspire
popd
