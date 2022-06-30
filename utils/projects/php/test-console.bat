@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php artisan inspire
pause
