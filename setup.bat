@echo off

echo --- Setting up ---
set startTime=%time: =0%

REM check if path contains script folder
:CHECKPATH
setlocal enableDelayedExpansion
set path_to_scripts=%~pd0scripts
if "x!PATH:%path_to_scripts%=!" == "x%PATH%" goto :ADDSCRIPTS
goto :CHECKWDRIVE

REM Add scripts folder to path
:ADDSCRIPTS
endlocal
echo ...
pushd cmd_setups
call cmd_setup_add_scripts %~pd0scripts
popd


:CHECKWDRIVE
endlocal
if exist w: goto :EXIT
if exist work goto :ADDWDRIVE

:ADDWDRIVE
echo ...
pushd cmd_setups
call cmd_setup_w_drive
popd

:EXIT
echo ...
set endTime=%time: =0%
call execution_time %startTime% %endTime%
echo Setup took %_executionTime%
echo --- Setup finished ---
exit /b
