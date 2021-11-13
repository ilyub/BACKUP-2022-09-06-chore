pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../..
laravel new %project%
popd
