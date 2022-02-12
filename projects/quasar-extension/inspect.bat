@echo off
call "../../utils/bat/quasar/%~n0" "%cd%/inspect.txt"
if not "%1" == "nopause" pause
