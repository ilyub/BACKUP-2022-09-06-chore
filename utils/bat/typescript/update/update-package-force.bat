pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm run update-package-force
call npm run update-package-force-peer
call npm run update-package-force-skylib
popd
