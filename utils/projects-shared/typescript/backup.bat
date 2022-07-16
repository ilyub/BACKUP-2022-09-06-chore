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
  echo Running %%p/%1
  pushd .
  cd ../../../backup/%%p
  set GIT_SSH_COMMAND=ssh -i ../../.ssh/id_rsa
  git checkout develop
  git pull
  popd
)
echo ________________________________________________________________________________
echo.
pause
