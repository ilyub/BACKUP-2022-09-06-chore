pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run inspect >%1
popd
