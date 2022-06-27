cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm audit --json | php "%~p0../../../php/audit.php"
pause
