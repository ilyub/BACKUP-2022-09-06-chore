cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%1
for /f "delims=" %%p in ('npm pack --pack-destination ../.npm') do set package=%%p
cd ../%project%
call npm run npm:install --save-%3 ../.npm/%package%
pause
