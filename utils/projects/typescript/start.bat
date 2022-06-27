for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
start npm run --if-present %1 %2
