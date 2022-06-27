cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
composer require --dev ramsey/conventional-commits
pause
