@echo off
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
php artisan db:seed --class=%1TableSeederInteractive
pause
