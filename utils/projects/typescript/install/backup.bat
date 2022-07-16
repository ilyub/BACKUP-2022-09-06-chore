@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../backup
set GIT_SSH_COMMAND=ssh -i ../.ssh/id_rsa
git clone git@github.com:ilyub/%project%.git
pause
