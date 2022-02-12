@echo off
call "../../../utils/bat/typescript/install/%~n0" %*
if not "%1" == "nopause" pause
