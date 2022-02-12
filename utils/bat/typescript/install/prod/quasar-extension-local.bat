pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../quasar-extension
for /f "delims=" %%i in ('npm pack --pack-destination ../.npm') do set package=%%i
cd ../%project%
call npm uninstall --no-audit @skylib/quasar-extension
call npm install --no-audit --save-prod --strict-peer-deps "../.npm/%package%"
popd
