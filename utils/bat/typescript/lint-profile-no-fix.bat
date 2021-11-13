pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
set TIMING=1
call npm run lint-no-fix
popd
