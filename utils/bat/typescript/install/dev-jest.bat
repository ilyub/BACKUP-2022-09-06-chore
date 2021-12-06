pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm install --no-audit --save-dev --strict-peer-deps ^
  @jest/test-sequencer ^
  @types/jest ^
  jest ^
  jest-environment-jsdom ^
  jest-environment-jsdom-fifteen ^
  jest-environment-node ^
  jest-transform-stub ^
  ts-jest
popd
