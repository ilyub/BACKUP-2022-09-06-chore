pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../eslint-plugin
call npm run build
for /f "delims=" %%i in ('npm pack --pack-destination ../.npm') do set package=%%i
cd ../%project%
call npm uninstall --no-audit @skylib/eslint-plugin
call npm install --no-audit --save-peer --strict-peer-deps "../.npm/%package%"
popd
