@echo off
:: Set the name of your requirements file
set REQUIREMENTS=requirements.txt

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Please install Python and try again.
    pause
    exit /b
)

:: Install required packages if necessary
if exist %REQUIREMENTS% (
    echo Checking for required packages...
    python -m pip install --upgrade pip >nul 2>&1
    python -m pip install -r %REQUIREMENTS%
) else (
    echo No requirements.txt found. Skipping package installation.
)

:: Run the main.exe in a new console window
if exist main.exe (
    echo Starting main.exe in a new window...
    start cmd /k main.exe
) else (
    echo main.exe not found. Please ensure it is in the current directory.
    pause
    exit /b
)

pause
