pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm uninstall --no-audit @skylib/lodash-commonjs-es
call npm install --no-audit --save-prod --strict-peer-deps @skylib/lodash-commonjs-es
popd
