@echo off
call "../../../utils/bat/typescript/install/peer/%~n0" %*
if not "%1" == "nopause" pause
