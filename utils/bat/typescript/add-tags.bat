pushd .
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php .git/hooks/add-tags.php
popd
