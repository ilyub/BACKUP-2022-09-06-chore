pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
vsce package
popd
