@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @mdi/js ^
  @types/faker ^
  @types/lodash ^
  @types/lodash-es ^
  date-fns ^
  faker@5.5.3 ^
  flag-icon-css ^
  lodash ^
  lodash-es ^
  typeface-roboto-multilang ^
  vue ^
  vue-router
if not "%1" == "nopause" pause
