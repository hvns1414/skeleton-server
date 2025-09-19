@echo off
REM install.bat — create venv for Windows and show usage hints
where python >nul 2>&1
if errorlevel 1 (
echo Python not found in PATH. Please install Python 3.8+ and re-run.
pause
exit /b 1
)


if not exist venv (
echo Creating virtual environment in .\venv ...
python -m venv venv
) else (
echo Virtual environment .\venv already exists.
)


echo.
echo To activate the virtual environment in this shell run:
echo venv\Scripts\activate
echo
echo After activation you can start the server:
echo python server_tcp.py
echo
pause