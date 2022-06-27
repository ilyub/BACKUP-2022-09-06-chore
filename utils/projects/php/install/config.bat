cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
composer require ilyub/config
pause
