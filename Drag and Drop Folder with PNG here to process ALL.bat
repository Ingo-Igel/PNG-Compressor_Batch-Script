@echo off

set path=%~d0%~p0
set /a counter=1

setlocal enabledelayedexpansion
for /R %* %%f in (*.png) do (

echo -start processing PNG no. !counter!

echo --start PNGquant
"%path%/pngquant/pngquant.exe" --quality=75-100 --ext=.png --force --skip-if-larger --speed 1 --strip --verbose  "%%f"
echo --finished PNGquant

echo --start ImageMagick
"%path%/ImageMagick/magick.exe" "%%f" -verbose -define preserve-timestamp=true -background #000000 -alpha background "%%f"
echo --finished ImageMagick

echo --start oxiPNG
"%path%/oxipng/oxipng.exe" -o max --strip safe --preserve "%%f"
echo --finished oxiPNG

echo -finished processing PNG no. !counter!
set /a counter+=1
)
endlocal

echo !!All done!!
pause