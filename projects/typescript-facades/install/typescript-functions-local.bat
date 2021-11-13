@echo off
call "../../../utils/bat/typescript/install/dependencies-peer/%~n0" %*
if not "%1" == "nopause" pause
