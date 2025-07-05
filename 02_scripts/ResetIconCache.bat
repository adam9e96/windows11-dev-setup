@echo off
taskkill /f /im explorer.exe
cd /d %userprofile%\AppData\Local\Microsoft\Windows\Explorer
del iconcache*.db /a
start explorer.exe
exit
