@echo off

set path=%~d0%~p0
set /a counter=1

:start

echo -start processing PNG no. %counter%

echo --start oxiPNG
"%path%/oxipng/oxipng.exe" -o max --strip safe --preserve %1
echo --finished oxiPNG

echo -finished processing PNG no. %counter%
set /a counter+=1

shift
if NOT x%1==x goto start

echo !!All done!!
pause