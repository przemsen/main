for /d /r . %%d in (bin,obj,packages) do @if exist "%%d" rd /s /q "%%d"
