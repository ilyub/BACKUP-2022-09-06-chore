@echo off
call "../../../utils/bat/typescript/install/prod/%~n0" %*
if not "%1" == "nopause" pause
