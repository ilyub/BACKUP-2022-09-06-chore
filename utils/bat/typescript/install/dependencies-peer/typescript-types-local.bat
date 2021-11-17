pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../typescript-types
for /f "delims=" %%i in ('npm pack --pack-destination ../.npm') do set package=%%i
cd ../%project%
call npm uninstall --no-audit @skylib/typescript-types
call npm install --no-audit --save-peer --strict-peer-deps "../.npm/%package%"
popd
