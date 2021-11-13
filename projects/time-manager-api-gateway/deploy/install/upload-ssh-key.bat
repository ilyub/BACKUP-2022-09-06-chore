@echo off
call "../../../../utils/bat/laravel/deploy/install/%~n0" %*
if not "%1" == "nopause" pause
