@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @types/jest ^
  @vue/test-utils ^
  vue-jest
if not "%1" == "nopause" pause
