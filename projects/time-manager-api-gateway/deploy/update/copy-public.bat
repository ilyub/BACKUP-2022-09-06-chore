@echo off
call "../../../../utils/bat/laravel/deploy/update/%~n0" %*
if not "%1" == "nopause" pause
