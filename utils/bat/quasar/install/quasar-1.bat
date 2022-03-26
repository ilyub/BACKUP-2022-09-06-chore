pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../..
call npm init quasar
popd
