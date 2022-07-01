@echo off
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%1
call npm run --if-present build
call npm run --if-present build-es
for /f "delims=" %%p in ('npm pack --pack-destination ../.npm') do set package=%%p
cd ../%project%
call npm run npm:install --save-%3 ../.npm/%package%
pause
