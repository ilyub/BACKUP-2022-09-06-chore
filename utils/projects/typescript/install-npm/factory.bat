@echo off
cd ..
for %%p in ("%cd%") do set project=%%~np
cd ../../../%project%
php "%~p0../../../php/has-dependency.php" dependencies %2 && (
  call npm run npm:install --save-prod npm:%2
)
php "%~p0../../../php/has-dependency.php" devDependencies %2 && (
  call npm run npm:install --save-dev npm:%2
)
php "%~p0../../../php/has-dependency.php" peerDependencies %2 && (
  call npm run npm:install --save-peer npm:%2
)
pause
