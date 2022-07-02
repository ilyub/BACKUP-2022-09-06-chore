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
  echo ________________________________________________________________________________
  echo.
  echo Running %%p/audit
  pushd .
  cd ../../../../%%p
  call npm audit --omit=dev
  popd
)
echo ________________________________________________________________________________
echo.
pause
