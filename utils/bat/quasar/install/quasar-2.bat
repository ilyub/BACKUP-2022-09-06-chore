pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call quasar ext add @quasar/testing
popd
