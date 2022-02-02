pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call quasar inspect >%1
popd
