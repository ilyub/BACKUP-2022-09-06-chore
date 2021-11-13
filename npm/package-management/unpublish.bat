@echo off
if "%1" == "" (
  echo Missing parameter 1
  pause
  exit
)
call npm unpublish %1
pause
