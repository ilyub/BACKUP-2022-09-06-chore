@echo off
call "../../../utils/bat/typescript/install/dev/%~n0" %*
if not "%1" == "nopause" pause
