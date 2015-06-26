Set WshShell = CreateObject("WScript.Shell")
app = """%PROGRAMFILES%\IIS Express\iisexpress""" & " /apppool:Clr4IntegratedAppPool"                     
ret = WshShell.Run(app, 0, false)
'                       ^--- Hide window
'                          ^--- Do not wait until program finishes 
