pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../typescript-functions
call npm run build
call npm run build-es
for /f "delims=" %%i in ('npm pack --pack-destination ../.npm') do set package=%%i
cd ../%project%
call npm uninstall --no-audit @skylib/functions
call npm install --no-audit --save-prod --strict-peer-deps "../.npm/%package%"
popd
