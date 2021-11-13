pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm install --no-audit --package-lock-only --strict-peer-deps
popd
