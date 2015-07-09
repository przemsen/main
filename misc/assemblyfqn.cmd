@echo off
powershell.exe -Command "[System.Reflection.AssemblyName]::GetAssemblyName('%1').FullName"
pause
