::disables the case sensitivity for folders that are crated before setting the WSL conf

for /R /D %%s in (.\*) do fsutil.exe file setCaseSensitiveInfo %%s disable
