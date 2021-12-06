pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm uninstall --no-audit @skylib/eslint-plugin
call npm install --no-audit --save-dev --strict-peer-deps @skylib/eslint-plugin
popd
