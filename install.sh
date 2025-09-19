#!/usr/bin/env bash
# install.sh — create venv and show usage hints
set -e
PY=python3
if ! command -v "$PY" >/dev/null 2>&1; then
PY=python
if ! command -v "$PY" >/dev/null 2>&1; then
echo "ERROR: python3 or python not found. Please install Python 3.8+." >&2
exit 1
fi
fi


# create virtualenv
if [ ! -d "venv" ]; then
echo "Creating virtual environment in ./venv ..."
"$PY" -m venv venv
else
echo "Virtual environment ./venv already exists."
fi


echo "To activate the virtual environment run:"
echo " source ./venv/bin/activate"


# Install requirements if you later add any; no external deps needed for the example's stdlib-only scripts
ACTIVATED=0
if [ -f "venv/bin/activate" ]; then
# show how to activate and optionally install
echo "(Optional) After activation, install requirements with:"
echo " pip install -r requirements.txt # if you add this file"
fi


echo
echo "Place server_tcp.py, client_tcp.py and tasks.txt in this folder."
echo "Then activate the venv and start the server with:"
echo " source ./venv/bin/activate"
echo " python server_tcp.py"
echo "Start clients similarly (edit client_tcp.py to set SERVER_HOST)."


echo "install.sh finished."