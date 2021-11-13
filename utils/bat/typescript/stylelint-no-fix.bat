pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run stylelint-no-fix
popd
