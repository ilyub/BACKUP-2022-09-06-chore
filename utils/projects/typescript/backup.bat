@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../backup/%project%
set GIT_SSH_COMMAND=ssh -i ../../.ssh/id_rsa
git checkout develop
git pull
pause
