for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php-cs-fixer fix --verbose
pause
