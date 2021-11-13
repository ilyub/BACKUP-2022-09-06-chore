@echo off
call "../../../utils/bat/laravel/database/%~n0" %*
if not "%1" == "nopause" pause
