@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @mdi/js ^
  @types/jest ^
  @vue/test-utils ^
  flag-icon-css ^
  typeface-roboto-multilang ^
  vue-jest ^
  vue-router ^
  vue-tsc

if not "%1" == "nopause" pause
