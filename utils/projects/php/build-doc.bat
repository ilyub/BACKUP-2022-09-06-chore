for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
doxygen .doxygen
pause
