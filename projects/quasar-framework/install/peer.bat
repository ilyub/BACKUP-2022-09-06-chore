@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @mdi/js-2@npm:@mdi/js ^
  @quasar/quasar-app-extension-testing-unit-jest ^
  @types/lodash ^
  @types/lodash-es ^
  @types/lunr ^
  @types/natural-compare ^
  @vue/test-utils ^
  lodash ^
  lodash-es ^
  lunr ^
  natural-compare ^
  vue
if not "%1" == "nopause" pause
