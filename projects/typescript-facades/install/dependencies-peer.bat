@echo off
call "../../../utils/bat/typescript/install/%~n0" tslib
if not "%1" == "nopause" pause
