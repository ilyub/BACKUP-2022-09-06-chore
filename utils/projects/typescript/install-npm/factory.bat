@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php "%~p0../../../php/has-dependency.php" dependencies %2 && (
  call npm run npm:install --save-prod %2@latest
)
php "%~p0../../../php/has-dependency.php" devDependencies %2 && (
  call npm run npm:install --save-dev %2@latest
)
php "%~p0../../../php/has-dependency.php" peerDependencies %2 && (
  call npm run npm:install --save-peer %2@latest
)
pause
