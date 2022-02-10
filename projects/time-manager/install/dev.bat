@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @types/jest ^
  @vue/vue3-jest ^
  vue-tsc
if not "%1" == "nopause" pause
