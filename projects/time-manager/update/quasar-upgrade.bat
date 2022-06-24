@echo off
call "../../../utils/bat/typescript/update/%~n0" %*
if not "%1" == "nopause" pause
