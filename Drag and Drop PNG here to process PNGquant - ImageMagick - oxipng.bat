@echo off

set path=%~d0%~p0
set /a counter=1

:start

echo -start processing PNG no. %counter%

echo --start PNGquant
"%path%/pngquant/pngquant.exe" --quality=75-100 --ext=.png --force --skip-if-larger --speed 1 --strip --verbose  %1
echo --finished PNGquant

echo --start ImageMagick
"%path%/ImageMagick/magick.exe" %1 -verbose -define preserve-timestamp=true -background black -alpha background %1
echo --finished ImageMagick

echo --start oxiPNG
"%path%/oxipng/oxipng.exe" -o max --strip safe --preserve %1
echo --finished oxiPNG

echo -finished processing PNG no. %counter%
set /a counter+=1

shift
if NOT x%1==x goto start

echo !!All done!!
pause