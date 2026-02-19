@echo off
cd /d "%~dp0"

echo Starting COVID19 LATAM Analytics setup...

sqlcmd -S localhost -E -i 00_run_all.sql

echo Setup completed successfully.
pause