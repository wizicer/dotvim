@echo off
rem as put vim file to $HOME directory, no need administrator privilege
rem goto check_Permissions
goto link_file

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
        echo Failure: Current permissions inadequate.
        pause
        goto end
    )
    cd /d "%~dp0"

:link_file
    cd ..
    rem for /f %%i in ('dir vimfiles\vimrc* /b') do mklink _%%i vimfiles\%%i /h
    mklink _vimrc vimfiles\vimrc /h

:update_submodule
    cd vimfiles
    git submodule update --init
:end
