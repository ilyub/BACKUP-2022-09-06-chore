@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @types/estree ^
  @types/lodash ^
  @types/lodash-es ^
  lodash ^
  lodash-es ^
  minimatch ^
  tslib
if not "%1" == "nopause" pause
