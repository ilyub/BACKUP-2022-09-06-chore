@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  get-current-line ^
  ts-morph
call "../../../utils/bat/typescript/install/%~n0/build"
call "../../../utils/bat/typescript/install/%~n0/build-doc"
call "../../../utils/bat/typescript/install/%~n0/commitlint"
call "../../../utils/bat/typescript/install/%~n0/core"
call "../../../utils/bat/typescript/install/%~n0/eslint"
call "../../../utils/bat/typescript/install/%~n0/jest"
if not "%1" == "nopause" pause
