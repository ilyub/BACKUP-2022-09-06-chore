@echo off
call "../../../utils/bat/laravel/install/%~n0" %*
if not "%1" == "nopause" pause
