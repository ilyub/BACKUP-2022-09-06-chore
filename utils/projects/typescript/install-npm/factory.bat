@echo off
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run npm:install --save-%3 npm:%2
pause
