pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm uninstall --no-audit @skylib/quasar-framework
call npm install --no-audit --save-prod --strict-peer-deps @skylib/quasar-framework
popd
