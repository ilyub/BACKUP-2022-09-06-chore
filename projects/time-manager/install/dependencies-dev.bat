@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @types/jest ^
  @vue/test-utils ^
  vue-jest
call "../../../utils/bat/typescript/install/%~n0/build-doc"
call "../../../utils/bat/typescript/install/%~n0/commitlint"
call "../../../utils/bat/typescript/install/%~n0/core"
call "../../../utils/bat/typescript/install/%~n0/eslint"
call "../../../utils/bat/typescript/install/%~n0/stylelint"
if not "%1" == "nopause" pause
