@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @mdi/js ^
  @types/lodash ^
  @types/lodash-es ^
  flag-icon-css ^
  lodash ^
  lodash-es ^
  natural-compare ^
  typeface-roboto-multilang ^
  vue ^
  vue-router
if not "%1" == "nopause" pause
