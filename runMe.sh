@echo off

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    REM Python is not installed, so let's download and install it
    echo Python is not installed. Installing Python...
    REM Downloading Python installer
    bitsadmin /transfer pythonInstaller https://www.python.org/ftp/python/3.10.3/python-3.10.3-amd64.exe "%TEMP%\python-3.10.3-amd64.exe"
    REM Installing Python silently
    "%TEMP%\python-3.10.3-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
    REM Checking if installation was successful
    if %errorlevel% equ 0 (
        echo Python has been successfully installed.
    ) else (
        echo Failed to install Python.
        exit /b 1
    )
) else (
    REM Python is already installed
    echo Python is already installed.
)

REM Optional: Clean up the temporary installer file
del "%TEMP%\python-3.10.3-amd64.exe"

exit /b 0

