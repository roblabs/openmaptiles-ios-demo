#!/bin/bash -e

# --------------------------------------------------------
# Generate app icons and xcassets file from a single image
# Ben Clayton, Calvium Ltd.
#  https://gist.github.com/benvium/2be6d673aa9ac284bb8a
# --------------------------------------------------------
# To use this, place script in `appname` folder inside your project (i.e. the folder that Xcode generates for you containing your source code, it's named after whatever you called the app).
# Create folder there called `RawImages`.
# Source icon should 1024x1024 and be called Icon.png. If the icon changes, you can just run this again to regenerate everything.
# This script assumes that you have the default setup of an Images.xcassets file containing the Icon.Iconset.
# Adjust iconPath below if you use something different
sourceIconName="512x512.png"

# Ensure we're running in location of script.
#cd "`dirname $0`"

# Check imagemagick is installed
# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
command -v convert >/dev/null 2>&1 || { echo >&2 "I require imagemagick but it's not installed.  Aborting."; exit 1; }

iconPath="Assets.xcassets/AppIcon.appiconset"

mkdir -p "$iconPath"

# clean it out
rm -rf $iconPath/*.png

# iPhone and iPad iOS7+ Sizes
convert $sourceIconName -resize 120x120 $iconPath/Icon-60@2x.png
convert $sourceIconName -resize 180x180 $iconPath/Icon-60@3x.png
convert $sourceIconName -resize 76x76 $iconPath/Icon-76.png
convert $sourceIconName -resize 152x152 $iconPath/Icon-76@2x.png
convert $sourceIconName -resize 40x40 $iconPath/Icon-40.png
convert $sourceIconName -resize 80x80 $iconPath/Icon-40@2x.png
convert $sourceIconName -resize 120x120 $iconPath/Icon-40@3x.png
convert $sourceIconName -resize 29x29 $iconPath/Icon-Small.png
convert $sourceIconName -resize 58x58 $iconPath/Icon-Small@2x.png
convert $sourceIconName -resize 87x87 $iconPath/Icon-Small@3x.png
convert $sourceIconName -resize 167x167 $iconPath/Icon-83.5@2x.png

cat > "$iconPath/Contents.json" << EOF
{
  "images" : [
    {
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "60x60"
	   ,"filename" : "Icon-60@2x.png"
    },
    {
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "60x60"
       ,"filename" : "Icon-60@3x.png"
    },
    {
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "76x76"
      ,"filename" : "Icon-76.png"
    },
    {
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "76x76"
      ,"filename" : "Icon-76@2x.png"
    },
    {
      "idiom" : "iphone",
      "scale" : "1x",
      "size" : "29x29"
      ,"filename" : "Icon-Small.png"
    },
    {
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "29x29"
      ,"filename" : "Icon-Small@2x.png"
    },
    {
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "29x29"
      ,"filename" : "Icon-Small@3x.png"
    },
    {
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "83.5x83.5"
      ,"filename" : "Icon-83.5@2x.png"
    },
    {
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "40x40"
      ,"filename" : "Icon-40@2x.png"
    },
    {
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "40x40"
      ,"filename" : "Icon-40@3x.png"
    },
    {
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "40x40"
      ,"filename" : "Icon-40.png"
    },
    {
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "40x40"
      ,"filename" : "Icon-40@2x.png"
    },
    {
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "29x29"
      ,"filename" : "Icon-Small.png"
    },
    {
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "29x29"
      ,"filename" : "Icon-Small@2x.png"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  },
  "properties" : {
    "pre-rendered" : true
  }
}
EOF
