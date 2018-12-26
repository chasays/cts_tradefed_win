@echo off
:: Author: coc media tester
:: Date : 2018-8-2 18:00:26

set SDK_ROOT=D:\dev\SDK
set CTS_ROOT=D:\dev\android-cts
set "RUN_PATH="
set "JAR_PATH="
set PATH=%PATH%;%SDK_ROOT%\platform-tools\;%SDK_ROOT%\tools\;%SDK_ROOT%\build-tools\27.0.3\
:: set RDBG_FLAG=-agentlib:jdwp=transport=dt_socket,server=y,suspend=y
SETLOCAL ENABLEDELAYEDEXPANSION 
 
:: include \android-cts\tools
for %%f in (%CTS_ROOT%\android-cts\tools\*.jar) do set RUN_PATH=%%f;!RUN_PATH!
 
:: include any host-side test jars
for %%f in (%CTS_ROOT%\android-cts\testcases\*.jar) do set JAR_PATH=%%f;!JAR_PATH!
 
java -Xmx200M -cp %RUN_PATH%%JAR_PATH% -DCTS_ROOT=%CTS_ROOT% com.android.compatibility.common.tradefed.command.CompatibilityConsole
