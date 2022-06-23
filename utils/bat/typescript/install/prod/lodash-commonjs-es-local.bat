pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../lodash-commonjs-es
call npm run build
call npm run build-es
for /f "delims=" %%i in ('npm pack --pack-destination ../.npm') do set package=%%i
cd ../%project%
call npm uninstall --no-audit @skylib/lodash-commonjs-es
call npm install --no-audit --save-prod --strict-peer-deps "../.npm/%package%"
popd
