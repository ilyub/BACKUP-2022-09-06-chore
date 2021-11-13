@echo off
call "../../../utils/bat/laravel/update/%~n0" %*
if not "%1" == "nopause" pause
