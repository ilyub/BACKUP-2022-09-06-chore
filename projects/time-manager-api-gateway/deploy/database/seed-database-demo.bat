@echo off
call "../../../../utils/bat/laravel/deploy/database/%~n0" %*
if not "%1" == "nopause" pause
