@echo off
title ��ӣ�ɾ���������ļ��������Ҽ��˵�
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo.&Echo ��ʹ���Ҽ����Թ���Ա������С�&&Pause >NUL&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion

SET /P ST=����1����Ҽ��˵�������2ɾ���Ҽ��˵���
if /I "%ST%"=="1" goto Add
if /I "%ST%"=="2" goto Remove

:Add
md "%APPDATA%\HaoZip">NUL 2>NUL
copy Config\HaoZip.hzc "%APPDATA%\HaoZip">NUL 2>NUL
copy Config\HaoZip.hzv "%APPDATA%\HaoZip">NUL 2>NUL
copy Config\HaoZip.stat "%APPDATA%\HaoZip">NUL 2>NUL
echo.>"%APPDATA%\HaoZip\update" 2>NUL
attrib +r "%APPDATA%\HaoZip\update">NUL 2>NUL
regsvr32 /s HaoZipExt.dll
exit

:Remove
regsvr32 /s /u HaoZipExt.dll
rd /s /q "%APPDATA%\HaoZip" 2>NUL
reg delete HKCU\Software\2345.com /f >NUL 2>NUL
taskkill /f /im explorer.exe
start explorer
exit
