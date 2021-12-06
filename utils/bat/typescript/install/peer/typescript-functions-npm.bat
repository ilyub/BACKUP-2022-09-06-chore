pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm uninstall --no-audit @skylib/functions
call npm install --no-audit --save-peer --strict-peer-deps @skylib/functions
popd
