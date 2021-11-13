pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm uninstall --no-audit @skylib/eslint-plugin
call npm link --no-audit --save-dev ../eslint-plugin
popd
