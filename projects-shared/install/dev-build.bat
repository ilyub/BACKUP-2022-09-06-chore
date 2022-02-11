@echo off
echo.
for %%p in (chore,config,eslint-plugin,quasar-framework,time-manager,time-manager-api-gateway,typescript-facades,typescript-framework,typescript-functions,typescript-types,vscode-autofold-comments) do (
  echo ________________________________________________________________________________
  echo.
  pushd .
  cd ../../projects/%%p/install
  if exist "%~n0.bat" (
    echo Run %%p/install/%~n0
    call "%~n0" nopause
  ) else (
    echo Skip %%p/install/%~n0
  )
  popd
)
pause
