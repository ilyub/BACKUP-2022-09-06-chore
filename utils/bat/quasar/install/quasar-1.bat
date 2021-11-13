pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../..
call quasar create %project%
popd
