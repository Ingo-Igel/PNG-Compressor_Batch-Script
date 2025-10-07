@echo off

set path=%~d0%~p0
set /a counter=1

setlocal enabledelayedexpansion
for /R %* %%f in (*.png) do (

echo -start processing PNG no. !counter!

echo --start oxiPNG
"%path%/oxipng/oxipng.exe" -o max --strip safe --preserve "%%f"
echo --finished oxiPNG

echo -finished processing PNG no. !counter!
set /a counter+=1
)
endlocal

echo !!All done!!
pause