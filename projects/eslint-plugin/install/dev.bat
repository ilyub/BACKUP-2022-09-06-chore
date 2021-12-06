@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  get-current-line ^
  ts-morph
if not "%1" == "nopause" pause
