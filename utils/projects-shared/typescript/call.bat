@echo off
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
  pushd .
  cd ../../../%%p
  type package.json | findstr "\"%1\":" >nul && (
    echo ________________________________________________________________________________
    echo.
    echo Running %%p/%1
    call npm run --if-present %1 %2
  )
  popd

)
echo ________________________________________________________________________________
echo.
pause
