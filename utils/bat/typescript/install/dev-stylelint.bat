pushd .
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
call npm install --no-audit --save-dev --strict-peer-deps ^
  css-property-sort-order-smacss ^
  postcss-html ^
  postcss-scss ^
  stylelint ^
  stylelint-no-unsupported-browser-features ^
  stylelint-order ^
  stylelint-scss
popd
