@echo off
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm audit
pause
