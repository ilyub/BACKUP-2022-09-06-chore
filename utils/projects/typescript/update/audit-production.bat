@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm audit --omit=dev --json | php "%~p0../../../php/audit.php"
pause
