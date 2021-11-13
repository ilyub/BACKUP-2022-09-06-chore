@echo off
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
call npm deprecate %1 "This version is no longer supported"
pause
