@echo off
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm audit fix --json | php "%~p0../../../php/audit-fix.php"
pause
