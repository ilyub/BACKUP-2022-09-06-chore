cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php artisan db:seed
pause
