@echo off
echo.
cd ../../../../%1
for %%d in (
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
  cd ../%%d
  type package.json | findstr "\"%2\":" >nul && (
    echo ________________________________________________________________________________
    echo.
    echo Installing %2 to %%d
    call npm run npm:install --save-%3 npm:%2
  )
)
pause
