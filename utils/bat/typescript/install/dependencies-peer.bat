pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm install --no-audit --save-peer --strict-peer-deps %*
popd
