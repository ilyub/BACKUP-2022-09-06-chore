@echo off
call "../../../utils/bat/typescript/install/%~n0/commitlint"
call "../../../utils/bat/typescript/install/%~n0/core"
call "../../../utils/bat/typescript/install/%~n0/eslint"
if not "%1" == "nopause" pause
