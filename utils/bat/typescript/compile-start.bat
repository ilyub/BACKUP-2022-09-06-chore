pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
start npm run compile --if-present
popd
