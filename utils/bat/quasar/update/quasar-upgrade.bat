pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call quasar upgrade --install
popd
