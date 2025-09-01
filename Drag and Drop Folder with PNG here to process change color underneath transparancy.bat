@echo off

set path=%~d0%~p0
set /a counter=1

setlocal enabledelayedexpansion
for /R %* %%f in (*.png) do (

echo -start processing PNG no. !counter!

echo --start ImageMagick
"%path%/ImageMagick/magick.exe" "%%f" -verbose -define preserve-timestamp=true -background #000000 -alpha background "%%f"
echo --finished ImageMagick

echo -finished processing PNG no. !counter!
set /a counter+=1
)
endlocal

echo !!All done!!
pause