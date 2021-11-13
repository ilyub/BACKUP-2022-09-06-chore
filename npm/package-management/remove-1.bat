@echo off
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
call npm owner add npm %1
pause
