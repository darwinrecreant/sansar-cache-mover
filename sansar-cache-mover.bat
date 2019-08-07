@echo OFF

rem Check for valid app data location

if not exist "%USERPROFILE%\AppData\Local" (
  echo AppData not found.
  pause 10
  GOTO END
)
set LL="%USERPROFILE%\AppData\Local\LindenLab"

echo.
echo App data found, now will delete Sansar cache (%LL%), continue? ([y]/n)

set /p continue2=
if /i "%continue2%" == "n" goto END

rem If LindenLab folder already exists, delete it. If it's a symlink then just delete the link.
if exist "%LL%" (
  rmdir %LL% /S
)

:ASKPATH

echo.
echo What path do you want to store the Sansar cache folder in? (someting like D:\AppData\Local\LindenLab)
set /p newLL=

rem If new path does not have :\ in it then ask for path again.

If NOT "%newLL%"=="%newLL::\=%" (
  if "%newLL%" == "" (
    echo This must be an path like D:\AppData\Local\LindenLab, or any folder
    goto ASKPATH
  )
) else (
  echo This must be an path like D:\AppData\Local\LindenLab, or any folder
  goto ASKPATH
)

echo.
echo Creating symbolic link between old Sansar folder to new Sansar folder (%newLL%), continue? ([y]/n)
set /p continue3=
if /i "%continue3%" == "n" goto END

rem Create folder of new path if it does not exist
mkdir %newLL%

rem Create the symlink
mklink /d %LL% %newLL%

rem Done

echo.
echo Sansar cache stored in new location successfully. From now on to delete cache, delete it in the new location.
pause 10

:END
