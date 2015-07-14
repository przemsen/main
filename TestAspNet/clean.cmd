for /d /r . %%d in (bin,packages) do @if exist "%%d" rd /s /q "%%d"
