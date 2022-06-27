echo.
for %%p in (
  chore,
  config,
  eslint-plugin,
  lodash-commonjs-es,
  quasar-extension,
  time-manager,
  typescript-facades,
  typescript-framework,
  typescript-functions,
  typescript-types,
  vscode-autofold-comments
) do (
  echo ________________________________________________________________________________
  echo.
  pushd .
  echo Running %%p/%1
  cd ../../../%%p
  start npm run --if-present %1 %2
  popd
)
pause
