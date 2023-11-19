@echo on

REM Create a virtual environment if it doesn't exist
if not exist ".\venv\" (
    python -m venv venv
)

REM Activate the virtual environment
call .\venv\Scripts\activate

REM Install requirements
pip install -r requirements.txt
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
REM Additional commands can be added here

echo Done.
pause

