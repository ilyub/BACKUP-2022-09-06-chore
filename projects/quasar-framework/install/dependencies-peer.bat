@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @quasar/quasar-app-extension-testing-unit-jest ^
  @types/lodash ^
  @types/lodash-es ^
  @types/lunr ^
  lodash ^
  lodash-es ^
  lunr ^
  vue
if not "%1" == "nopause" pause
