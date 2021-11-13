pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm clean-install --no-audit --strict-peer-deps
popd
