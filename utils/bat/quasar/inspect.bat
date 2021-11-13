pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call quasar inspect >"%cd%/../chore/projects/time-manager/inspect.txt"
popd
