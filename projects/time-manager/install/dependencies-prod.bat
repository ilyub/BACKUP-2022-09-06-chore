@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @types/lodash ^
  @types/lodash-es ^
  flag-icon-css ^
  lodash ^
  lodash-es ^
  vue ^
  vue-router
if not "%1" == "nopause" pause
