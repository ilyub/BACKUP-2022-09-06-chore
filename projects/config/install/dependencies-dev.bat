@echo off
call "../../../utils/bat/typescript/install/%~n0/build"
call "../../../utils/bat/typescript/install/%~n0/commitlint"
call "../../../utils/bat/typescript/install/%~n0/core"
call "../../../utils/bat/typescript/install/%~n0/eslint"
call "../../../utils/bat/typescript/install/%~n0/jest"
call "../../../utils/bat/typescript/install/%~n0/stylelint"
if not "%1" == "nopause" pause
