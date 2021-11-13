pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm audit fix --json --strict-peer-deps | php "%cd%/../chore/utils/php/audit-fix.php"
popd
