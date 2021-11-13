@echo off
call npm update -g --no-audit --strict-peer-deps ^
  generator-code ^
  vsce ^
  yo
pause
