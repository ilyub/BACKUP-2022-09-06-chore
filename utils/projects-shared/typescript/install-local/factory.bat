@echo off
echo.
cd ../../../../%1
echo ________________________________________________________________________________
echo.
echo Packaging %2
call npm run --if-present build
call npm run --if-present build-es
for /f "delims=" %%p in ('npm pack --pack-destination ../.npm') do set package=%%p
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
    call npm run npm:install --save-%3 ../.npm/%package%
  )
)
pause
