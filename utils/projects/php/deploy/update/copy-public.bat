@echo off
cd ../..
for %%p in ("%cd%") do set project=%%~np
php ../../utils/php/deploy.php %project% copy-public
pause
