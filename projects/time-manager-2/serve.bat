@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
start npm run serve
