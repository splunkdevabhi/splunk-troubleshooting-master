@echo off

if NOT EXIST \\%1\c$\PROGRA~1\SplunkUniversalForwarder\etc\system\local\inputs.conf (
  echo [default] >> \\%1\c$\PROGRA~1\SplunkUniversalForwarder\etc\system\local\inputs.conf
  echo host = %1 >> \\%1\c$\PROGRA~1\SplunkUniversalForwarder\etc\system\local\inputs.conf
)


findstr /I serverName \\%1\c$\PROGRA~1\SplunkUniversalForwarder\etc\system\local\server.conf
if %errorlevel%==1 (
    fart -C \\%1\c$\PROGRA~1\SplunkUniversalForwarder\etc\system\local\server.conf [general] [general]\r\nserverName=%1
    )


rem psexec \\%1 c:\PROGRA~1\SplunkUniversalForwarder\bin\splunk restart