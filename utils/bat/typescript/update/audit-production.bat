pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run npm:audit --json --omit=dev | php "%cd%/../chore/utils/php/audit.php"
popd
