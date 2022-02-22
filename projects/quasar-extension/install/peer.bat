@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @mdi/js-dynamic@npm:@mdi/js ^
  @quasar/quasar-app-extension-testing-unit-jest ^
  @types/lodash ^
  @types/lodash-es ^
  @vue/test-utils ^
  lodash ^
  lodash-es ^
  type-fest ^
  vue ^
  vuedraggable@next
if not "%1" == "nopause" pause
