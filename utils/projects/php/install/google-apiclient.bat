@echo off
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call composer require google/apiclient
pause
