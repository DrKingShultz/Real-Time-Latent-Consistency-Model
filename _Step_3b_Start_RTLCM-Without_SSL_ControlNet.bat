@echo on

cd /d "%~dp0"
call ".\venv\Scripts\activate"

uvicorn "app-controlnet:app" --host 0.0.0.0 --port 7861 --reload

pause
