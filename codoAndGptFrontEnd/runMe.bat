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
        REM Clean up the temporary installer file
        del "%TEMP%\python-3.10.3-amd64.exe"
    ) else (
        echo Failed to install Python.
        exit /b 1
    )
) else (
    REM Python is already installed
    echo Python is already installed.
)

REM Check if Flask is installed
python -c "import flask" >nul 2>&1
if %errorlevel% neq 0 (
    REM Flask is not installed, so let's install it
    echo Flask is not installed. Installing Flask...
    REM Installing Flask using pip
    python -m pip install flask
    REM Checking if installation was successful
    if %errorlevel% equ 0 (
        echo Flask has been successfully installed.
    ) else (
        echo Failed to install Flask.
        exit /b 1
    )
) else (
    REM Flask is already installed
    echo Flask is already installed.
)

exit /b 0

