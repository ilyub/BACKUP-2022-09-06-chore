@echo off
call "../../utils/bat/vscode/%~n0" %*
if not "%1" == "nopause" pause
