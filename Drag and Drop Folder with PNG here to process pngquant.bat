@echo off

set path=%~d0%~p0
set /a counter=1

setlocal enabledelayedexpansion
for /R %* %%f in (*.png) do (

echo -start processing PNG no. !counter!

echo --start PNGquant
"%path%/pngquant/pngquant.exe" --quality=75-100 --ext=.png --force --skip-if-larger --speed 1 --strip --verbose  "%%f"
echo --finished PNGquant

echo -finished processing PNG no. !counter!
set /a counter+=1
)
endlocal

echo !!All done!!
pause