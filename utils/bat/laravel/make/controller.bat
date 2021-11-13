pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
php artisan make:controller --invokable %1
popd
