@echo off

set path=%~d0%~p0

:start

"%path%/ImageMagick/magick.exe" %1 -background black -alpha background %1

shift
if NOT x%1==x goto start

echo "All done!"
pause