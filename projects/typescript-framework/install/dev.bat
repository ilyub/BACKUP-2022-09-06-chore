@echo off
call "../../../utils/bat/typescript/install/%~n0" jest-mock-axios
if not "%1" == "nopause" pause
