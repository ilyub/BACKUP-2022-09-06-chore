@echo off
call "../../../utils/bat/typescript/install/%~n0" ^
  @types/facebook-js-sdk ^
  @types/gapi.auth2 ^
  @types/jquery ^
  @types/lodash ^
  @types/lodash-es ^
  @types/pouchdb ^
  @types/pouchdb-adapter-memory ^
  @types/sha256 ^
  @types/uuid ^
  axios ^
  date-fns ^
  jquery ^
  lodash ^
  lodash-es ^
  minisearch ^
  pouchdb ^
  pouchdb-adapter-memory ^
  pouchdb-collate ^
  sha256 ^
  tslib ^
  uuid ^
if not "%1" == "nopause" pause
