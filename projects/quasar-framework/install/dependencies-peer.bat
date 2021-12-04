@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @quasar/quasar-app-extension-testing-unit-jest ^
  @types/lunr ^
  lunr ^
  vue
if not "%1" == "nopause" pause
