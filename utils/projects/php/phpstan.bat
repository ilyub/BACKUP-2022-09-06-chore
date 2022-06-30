@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
phpstan analyse -c phpstan.neon
pause
