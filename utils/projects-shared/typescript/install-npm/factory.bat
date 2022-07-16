@echo off
echo.
cd ../../../%1
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
  php "%~p0../../../php/has-dependency.php" dependencies %2 && (
    echo ________________________________________________________________________________
    echo.
    echo Installing %2 to %%d
    call npm run npm:install --save-prod %2@latest
  )
  php "%~p0../../../php/has-dependency.php" devDependencies %2 && (
    echo ________________________________________________________________________________
    echo.
    echo Installing %2 to %%d
    call npm run npm:install --save-dev %2@latest
  )
  php "%~p0../../../php/has-dependency.php" peerDependencies %2 && (
    echo ________________________________________________________________________________
    echo.
    echo Installing %2 to %%d
    call npm run npm:install --save-peer %2@latest
  )
)
echo ________________________________________________________________________________
echo.
pause
