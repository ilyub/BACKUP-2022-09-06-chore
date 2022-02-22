pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm install --no-audit --save-dev --strict-peer-deps ^
  @types/eslint ^
  @typescript-eslint/eslint-plugin ^
  @typescript-eslint/parser ^
  eslint ^
  eslint-config-prettier ^
  eslint-import-resolver-typescript ^
  eslint-plugin-boundaries ^
  eslint-plugin-es ^
  eslint-plugin-eslint-comments ^
  eslint-plugin-etc ^
  eslint-plugin-filenames ^
  eslint-plugin-github ^
  eslint-plugin-import ^
  eslint-plugin-jest ^
  eslint-plugin-jest-dom ^
  eslint-plugin-jsdoc ^
  eslint-plugin-lodash ^
  eslint-plugin-no-type-assertion ^
  eslint-plugin-no-use-extend-native ^
  eslint-plugin-only-warn ^
  eslint-plugin-pii ^
  eslint-plugin-prettier ^
  eslint-plugin-promise ^
  eslint-plugin-regexp ^
  eslint-plugin-security ^
  eslint-plugin-simple-import-sort ^
  eslint-plugin-sonarjs ^
  eslint-plugin-sort-export-all ^
  eslint-plugin-sort-destructure-keys ^
  eslint-plugin-typescript-sort-keys ^
  eslint-plugin-unicorn ^
  eslint-plugin-vue ^
  eslint-plugin-vue-scoped-css ^
  eslint-plugin-xss ^
  prettier ^
  vue-eslint-parser
popd
