@echo off
call "../../../utils/bat/vscode/install/%~n0" %*
if not "%1" == "nopause" pause
