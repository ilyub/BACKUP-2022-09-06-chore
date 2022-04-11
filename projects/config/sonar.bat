@echo off
call "../../utils/bat/%~n0" %*
if not "%1" == "nopause" pause
