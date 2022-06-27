cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
composer dump-autoload
pause
