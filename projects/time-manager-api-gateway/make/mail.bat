@echo off
call "../../../utils/bat/laravel/make/%~n0" %*
if not "%1" == "nopause" pause
