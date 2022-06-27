cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
quasar upgrade --install
pause
