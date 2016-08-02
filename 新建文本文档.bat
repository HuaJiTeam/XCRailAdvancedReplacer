@echo off
setlocal enabledelayedexpansion
color 3F
echo ::------------Batch for finding file------------::
echo.
:FindFile
set /p Dir=Please input directory : 
set /p File=Please input file name (eg:*.txt) : 
echo.
echo ------------File Finded---------------------
for /r "%Dir%"  %%i in (%File%) do (echo %%i)
::for /f "usebackq" "delims=" %%b in ('dir /a-d/s/b %Dir%/%File% ') echo %%b

echo ------------File Finded---------------------
echo.

:ChooseHandle
echo ©°©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©´
echo ::   (1) To rename all file          ¡ú 1   ::
echo ::   (2) To see content of file      ¡ú 2   ::        
echo ::   (3) To replace content of file  ¡ú 3   ::
echo ::   (4) To find file again          ¡ú 4   ::
echo ::   (E) Exit                        ¡ú E   ::
echo ©¸©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¼

echo.
:InputChoice
echo ------------Do your choice-----------------
set /p chs=Please input ur choice : 
echo ------------End of Choice------------------
echo.

if %chs% EQU 1  goto Renameallfile
if %chs% EQU 2  goto Display
if %chs% EQU 3  goto Replace
if %chs% EQU 4  goto FindFile
if "%chs%"=="E" (
 goto End 
) else (
 echo Wrong choice, Please input ur choice again !
 goto InputChoice
)


:: Rename all file name
:Renameallfile
 set /p strName=Please input new file name : 
 for /r "%Dir%"  %%f in (%File%) do (
 ren %%f %strName%
 )
 echo -------------------------------------------
 goto EndOfChoice 
:: Display all content of file
:Display
 echo -------------------------------------------
 for /r "%Dir%"  %%i in ("%File%") do (
  echo [-----File Name----]
  echo %%i
  echo -----File Content-----------------
  for /f "usebackq" %%j in ("%%i") do (
  echo %%j
  )
 )
 echo -------------------------------------------
 goto EndOfChoice

:: Replace the content of file finded
:Replace
 set /p strOld=Input content u want to replace : 
 set /p strNew=Input content u want to replace to : 
 for /r "%Dir%"  %%c in ("%File%") do (
 set FileName=%%c
 for /f "usebackq" %%x in ("%%c") do (
  set line=%%x
:: echo !line!
  set "line=!line:%strOld%=%strNew%!"
  echo !line!>>ttttmp.txt
  )
copy xcrail.ogg "%%c"
echo %%c is replaced!
)
goto EndOfChoice

:EndOfChoice
goto ChooseHandle

:End
exit