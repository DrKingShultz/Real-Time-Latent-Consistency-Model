@echo off

cd /d "%~dp0"
call ".\venv\Scripts\activate"

uvicorn "app-controlnet:app" --host 0.0.0.0 --port 7861 --reload --ssl-keyfile=key.pem --ssl-certfile=certificate.pem

pause
