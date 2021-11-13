pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm uninstall --no-audit @skylib/typescript-types
call npm link --no-audit --save-prod ../typescript-types
popd
