cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
composer require --dev captainhook/captainhook
pause
