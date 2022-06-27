cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
php artisan make:migration --create=%1 migrate_%1
pause
