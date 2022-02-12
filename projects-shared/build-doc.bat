@echo off
echo.
for %%p in (chore,config,eslint-plugin,quasar-extension,time-manager,time-manager-api-gateway,typescript-facades,typescript-framework,typescript-functions,typescript-types,vscode-autofold-comments) do (
  echo ________________________________________________________________________________
  echo.
  pushd .
  cd ../projects/%%p
  if exist "%~n0.bat" (
    echo Run %%p/%~n0
    call "%~n0" nopause
  ) else (
    echo Skip %%p/%~n0
  )
  popd
)
pause
