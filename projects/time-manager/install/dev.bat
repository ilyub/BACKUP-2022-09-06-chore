@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @types/jest ^
  @vue/test-utils ^
  vue-jest ^
  vue-tsc
if not "%1" == "nopause" pause
