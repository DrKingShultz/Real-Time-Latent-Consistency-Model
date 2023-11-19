@echo on

cd /d "%~dp0"

call ".\venv\Scripts\activate"

echo Generating SSL certificate...
openssl req -newkey rsa:4096 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem

