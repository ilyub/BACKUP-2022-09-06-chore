@echo off
call "../../../../utils/bat/laravel/deploy/reset/%~n0" %*
if not "%1" == "nopause" pause
