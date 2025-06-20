@echo off
cd /d %~dp0
call gradlew test --stacktrace
pause
