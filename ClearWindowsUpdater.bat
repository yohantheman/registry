@echo off
::Administrator Right Confirmation
setlocal

@echo off
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUServer /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUStatusServer /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v UseWUServer /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v UseWUServer /t REG_DWORD /d 0

net stop appidsvc
net stop bits
net stop cryptSvc
net stop wuauserv

ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 Catroot2.old
rmdir /s /q %systemroot%\SoftwareDistribution.old
rmdir /s /q %systemroot%\System32\Catroot2.old

net start appidsvc
net start bits
net start cryptSvc
net start wuauserv

