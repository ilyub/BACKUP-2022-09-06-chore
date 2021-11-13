pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../..
yo code %project%
popd
