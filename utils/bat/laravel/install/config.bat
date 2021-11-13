pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call composer require ilyub/config
popd
