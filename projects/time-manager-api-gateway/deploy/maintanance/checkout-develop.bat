@echo off
call "../../../../utils/bat/laravel/deploy/maintanance/%~n0" %*
if not "%1" == "nopause" pause
