@echo off
call "../../utils/bat/typescript/%~n0" "%cd%/inspect.txt"
if not "%1" == "nopause" pause
