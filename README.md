# PNG-Compressor Batch-Script

This repository contains batch scripts and executable comandline tools that compress PNG files using lossy or lossless methods and set the color of transparent pixels to a defined value.

## Motivation

For my mods, I had to compress PNG textures and spritesheets, but at the same time, set the RGB values of completely transparent pixels to 0,0,0. Since all of the maintained PNG quantization tools I know set the RGB values of transparent pixels to unpredictable values, I had to create a workaround. This resulted in the batch scripts contained here.

## Description

The batch script uses three command-line tools to process PNG and achieve the desired result.

1. Lossy compression with [pngquant](https://pngquant.org/)

2. Setting the RGB values of transparent pixels with [ImageMagick](https://imagemagick.org/)

3. Further lossless compression with [oxipng](https://github.com/oxipng/oxipng)


## Included tools

* [pngquant](https://pngquant.org/) (pre-compiled binary taken from [pngquant-bin](https://github.com/imagemin/pngquant-bin/tree/main/vendor/win))
* [ImageMagick](https://imagemagick.org/)
* [oxipng](https://github.com/oxipng/oxipng)


## Presets for the tools in the batch script

* [pngquant](https://pngquant.org/)
  * `--quality=75-100` (Better than the default range of 65-80)
  * `--speed 1` (best quality)
  * `--ext=.png` (override existing files)
  * `--skip-if-larger`
  * `--strip` (remove metadata)
* [ImageMagick](https://usage.imagemagick.org/masking/#alpha_background)
  * `-define preserve-timestamp=true` (retain timestamp)
  * `-background #000000` (sets the RGB color of fully transparent pixels)
* [qxipng](https://github.com/oxipng/oxipng/blob/master/MANUAL.txt)
  * `-opt max` (maximum optimisation level)
  * `-strip safe` (remove all non-critical metadata)
  * `-preserve` (retain timestamp)

## Getting Started

### Dependencies

* Windows 10 or 11

### Installing

Download and unzip the latest [Release](https://github.com/Ingo-Igel/PNG-Compressor_Batch-Script/releases).

### Executing the Batch Script

Drag and drop PNG files or folders including PNG files onto the coresponding .bat files. Drag and drop folders will process through all subfolders.

__Be aware that the script modifies the files themselves.__

## Help

### Change the RGB value set for transparent pixels

Right-click the .bat file and choose Edit.

Find the following line:

>"%path%/ImageMagick/magick.exe" %1 -verbose -define preserve-timestamp=true -background #000000 -alpha background %1

Change the HEX color definition after the `-background` comand to your desired color. Then, save and close.

## Version History

* 1.0
    * Initial Release

## License

This project is licensed under the MIT License - see the LICENSE file for details

__Please note the licenses for the command-line tools in their respective folders.__

* pngquant ([GNU GENERAL PUBLIC LICENSE Version 3](https://github.com/kornelski/pngquant/blob/main/COPYRIGHT))
* ImageMagick ([license](https://imagemagick.org/script/license.php))
* qxipng ([MIT license](https://github.com/oxipng/oxipng/blob/master/MANUAL.txt))