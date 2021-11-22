@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @types/lodash ^
  @types/lodash-es ^
  lodash ^
  lodash-es ^
  vue
if not "%1" == "nopause" pause
