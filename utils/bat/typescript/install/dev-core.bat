pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm install --no-audit --save-dev --strict-peer-deps ^
  @types/node@15.14.0 ^
  cpy-cli ^
  npm-check-updates
popd
