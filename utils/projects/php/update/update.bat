cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call composer update
pause
