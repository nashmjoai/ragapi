@echo off
title Nashm RAG API Server
echo Starting Nashm RAG API...
cd /d "%~dp0"
call "%~dp0venv\Scripts\activate.bat"
python main.py
pause
