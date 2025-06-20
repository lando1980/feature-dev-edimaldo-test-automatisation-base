@echo off
echo Limpiando proyecto...
call gradlew clean

echo.
echo Estableciendo propiedades del sistema...
set KARATE_ENV=dev
set KARATE_OPTIONS=--tags ~@ignore

echo.
echo Ejecutando pruebas Karate (modo debug)...
call gradlew -i test -Dkarate.env=%KARATE_ENV% -Dkarate.options=%KARATE_OPTIONS% -Dlogback.configurationFile=src/test/java/logback-test.xml

echo.
echo Pruebas finalizadas. Revisa el reporte en: build/reports/tests/test/index.html
pause
