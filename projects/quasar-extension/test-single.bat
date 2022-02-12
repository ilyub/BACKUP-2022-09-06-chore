@echo off
call "../../utils/bat/typescript/%~n0" ListItem
if not "%1" == "nopause" pause
