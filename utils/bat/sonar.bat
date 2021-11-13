pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call sonar-scanner
popd
