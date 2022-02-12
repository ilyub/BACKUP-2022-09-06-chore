@echo off
call "../../../utils/bat/quasar/install/%~n0" %*
if not "%1" == "nopause" pause
