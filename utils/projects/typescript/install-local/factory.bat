@echo off
for %%p in ("%cd%") do set project=%%~np
cd ../../../%1
call npm run --if-present build
call npm run --if-present build-es
for /f "delims=" %%p in ('npm pack --pack-destination ../.npm') do set package=%%p
cd ../%project%
php "%~p0../../../php/has-dependency.php" dependencies %2 && (
  call npm run npm:install --save-prod ../.npm/%package%
)
php "%~p0../../../php/has-dependency.php" devDependencies %2 && (
  call npm run npm:install --save-dev ../.npm/%package%
)
php "%~p0../../../php/has-dependency.php" peerDependencies %2 && (
  call npm run npm:install --save-peer ../.npm/%package%
)
pause
