pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm install --no-audit --save-dev --strict-peer-deps ^
  @types/eslint ^
  @typescript-eslint/eslint-plugin ^
  @typescript-eslint/parser ^
  eslint ^
  eslint-import-resolver-typescript ^
  eslint-plugin-es ^
  eslint-plugin-filenames ^
  eslint-plugin-import ^
  eslint-plugin-jsdoc ^
  eslint-plugin-no-type-assertion ^
  eslint-plugin-prettier ^
  eslint-plugin-regexp ^
  eslint-plugin-simple-import-sort ^
  eslint-plugin-sort-destructure-keys ^
  eslint-plugin-typescript-sort-keys ^
  eslint-plugin-unicorn ^
  eslint-plugin-vue ^
  prettier ^
  vue-eslint-parser
popd
