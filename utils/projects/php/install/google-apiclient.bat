cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
composer require google/apiclient
pause
