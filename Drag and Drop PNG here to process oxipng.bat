@echo off

set path=%~d0%~p0

:start

"%path%/oxipng/oxipng.exe" -o max --strip safe %1

shift
if NOT x%1==x goto start

echo "All done!"
pause