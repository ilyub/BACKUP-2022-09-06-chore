@echo off
echo.
for %%p in (chore,config,eslint-plugin,lodash-commonjs-es,quasar-extension,typescript-facades,typescript-framework,typescript-functions,typescript-types) do (
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
