@echo off
call "../../utils/bat/php/%~n0" %*
if not "%1" == "nopause" pause
