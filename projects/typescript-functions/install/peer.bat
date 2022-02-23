@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @sinonjs/fake-timers ^
  @types/jquery ^
  @types/lodash ^
  @types/lodash-es ^
  @types/sinonjs__fake-timers ^
  jest-extended ^
  jquery ^
  lodash ^
  lodash-es ^
  reflect-metadata ^
  ts-toolbelt ^
  tslib ^
  type-fest
if not "%1" == "nopause" pause
