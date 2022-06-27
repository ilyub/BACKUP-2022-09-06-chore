for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
sonar-scanner
pause
