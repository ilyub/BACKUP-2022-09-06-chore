@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @mdi/js ^
  autoprefixer ^
  flag-icon-css ^
  typeface-roboto-multilang ^
  vue-router ^
  vue-tsc
if not "%1" == "nopause" pause
