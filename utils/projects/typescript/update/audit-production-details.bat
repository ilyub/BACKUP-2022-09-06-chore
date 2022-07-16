@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm audit --omit=dev
pause
