@echo off
call "../../../utils/bat/typescript/install/dependencies-dev/%~n0" %*
if not "%1" == "nopause" pause
