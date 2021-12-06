pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../config
for /f "delims=" %%i in ('npm pack --pack-destination ../.npm') do set package=%%i
cd ../%project%
call npm uninstall --no-audit @skylib/config
call npm install --no-audit --save-dev --strict-peer-deps "../.npm/%package%"
popd
