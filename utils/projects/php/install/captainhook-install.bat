cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
vendor/bin/captainhook install
pause
