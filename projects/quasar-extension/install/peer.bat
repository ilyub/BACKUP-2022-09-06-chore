@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @mdi/js-dynamic@npm:@mdi/js ^
  @quasar/quasar-app-extension-testing ^
  @quasar/quasar-app-extension-testing-unit-jest ^
  @vue/test-utils ^
  maska ^
  quasar ^
  type-fest ^
  vue ^
  vuedraggable@next
if not "%1" == "nopause" pause
