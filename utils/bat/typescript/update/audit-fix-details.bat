pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm audit fix --strict-peer-deps
popd
