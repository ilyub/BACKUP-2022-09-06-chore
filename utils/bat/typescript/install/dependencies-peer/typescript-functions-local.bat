pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm uninstall --no-audit @skylib/functions
call npm link --no-audit --save-peer ../typescript-functions
popd
