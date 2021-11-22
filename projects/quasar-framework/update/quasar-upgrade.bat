@echo off
call "../../../utils/bat/quasar/update/%~n0" %*
if not "%1" == "nopause" pause
