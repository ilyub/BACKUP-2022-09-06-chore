pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run npm:audit fix --strict-peer-deps
popd
