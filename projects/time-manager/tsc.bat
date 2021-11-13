@echo off
call "../../utils/bat/quasar/%~n0" %*
if not "%1" == "nopause" pause
