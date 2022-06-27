cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run npm:install --save-%2 npm:%1
pause
