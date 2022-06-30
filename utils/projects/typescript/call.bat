@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run --if-present %1 %2
pause
