@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @typescript-eslint/utils ^
  tsutils ^
  typescript
if not "%1" == "nopause" pause
