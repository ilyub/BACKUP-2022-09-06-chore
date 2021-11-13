pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm uninstall --no-audit @skylib/facades
call npm link --no-audit --save-prod ../typescript-facades
popd
