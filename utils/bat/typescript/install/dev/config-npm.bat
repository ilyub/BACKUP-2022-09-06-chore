pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm uninstall --no-audit @skylib/config
call npm install --no-audit --save-dev --strict-peer-deps @skylib/config
popd
