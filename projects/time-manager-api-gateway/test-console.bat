@echo off
call "../../utils/bat/laravel/%~n0" %*
if not "%1" == "nopause" pause
