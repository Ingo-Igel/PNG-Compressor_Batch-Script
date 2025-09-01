@echo off

set path=%~d0%~p0

:start

"%path%/pngquant/pngquant.exe" --quality=75-100 --ext=.png --force --skip-if-larger --speed 1 --strip --verbose %1

shift
if NOT x%1==x goto start

echo "All done!"
pause