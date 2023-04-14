@echo off
setlocal enabledelayedexpansion

set PROJECT_PATH=%1
set JRE_OUTPUT_PATH=%2

set MODULE_LIST=
for /f "tokens=* delims=" %%i in ('.\bin\jdeps.exe --list-deps %PROJECT_PATH%') do (
  set "MODULE_LIST=!MODULE_LIST! %%i"
)

echo jlink --module-path .\bin\jmods --add-modules %MODULE_LIST% --output %JRE_OUTPUT_PATH%
.\bin\jlink --module-path .\bin\jmods --add-modules %MODULE_LIST% --output %JRE_OUTPUT_PATH%

PAUSE