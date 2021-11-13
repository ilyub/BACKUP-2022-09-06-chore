pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm publish --access=public
popd
