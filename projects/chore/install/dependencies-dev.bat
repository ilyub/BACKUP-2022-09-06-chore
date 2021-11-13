@echo off
call "../../../utils/bat/typescript/install/%~n0/commitlint"
call "../../../utils/bat/typescript/install/%~n0/core"
if not "%1" == "nopause" pause
