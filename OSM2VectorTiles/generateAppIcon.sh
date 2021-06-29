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
sourceIconName="App-Store-1024x1024.png"

# Ensure we're running in location of script.
#cd "`dirname $0`"

# Check imagemagick is installed
# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
command -v convert >/dev/null 2>&1 || { echo >&2 "I require imagemagick but it's not installed.  Aborting."; exit 1; }

iconPath="Assets.xcassets/AppIcon.appiconset"

mkdir -p "$iconPath"

# clean it out
rm -rf $iconPath/*.png

# iOS 7-14
# iPhone-Notification
convert $sourceIconName -resize 40x40 $iconPath/iPhone-Notification-20@2x.png
convert $sourceIconName -resize 60x60 $iconPath/iPhone-Notification-20@3x.png

# iPhone
convert $sourceIconName -resize 58x58 $iconPath/iPhone-29@2x.png
convert $sourceIconName -resize 87x87 $iconPath/iPhone-29@3x.png

# iPhone Spotlight
convert $sourceIconName -resize  80x80  $iconPath/iPhone-Spotlight-40@2x.png
convert $sourceIconName -resize 120x120 $iconPath/iPhone-Spotlight-40@3x.png

# iPhone App
convert $sourceIconName -resize 120x120 $iconPath/iPhone-App-60@2x.png
convert $sourceIconName -resize 180x180 $iconPath/iPhone-App-60@3x.png

# iPad Notifications
convert $sourceIconName -resize 20x20 $iconPath/iPad-Notification-20@1x.png
convert $sourceIconName -resize 40x40 $iconPath/iPad-Notification-20@2x.png

# iPad Settings
convert $sourceIconName -resize 29x29 $iconPath/iPad-Settings-29@1x.png
convert $sourceIconName -resize 58x58 $iconPath/iPad-Settings-29@2x.png

# iPad Spotlight
convert $sourceIconName -resize 40x40 $iconPath/iPad-Spotlight-40@1x.png
convert $sourceIconName -resize 80x80 $iconPath/iPad-Spotlight-40@2x.png

# iPad App
convert $sourceIconName -resize  76x76  $iconPath/iPad-Spotlight-76@1x.png
convert $sourceIconName -resize 152x152 $iconPath/iPad-Spotlight-76@2x.png

# iPad Pro
convert $sourceIconName -resize 167x167 $iconPath/iPad Pro-83.5@2x.png

# App Store
# Use the 1024x1024.png

cat > "$iconPath/Contents.json" << EOF
{
  "images" : [
    {
      "filename" : "iPhone-Notification-20@2x.png",
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "20x20"
    },
    {
      "filename" : "iPhone-Notification-20@3x.png",
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "20x20"
    },
    {
      "filename" : "iPhone-29@2x.png",
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "29x29"
    },
    {
      "filename" : "iPhone-29@3x.png",
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "29x29"
    },
    {
      "filename" : "iPhone-Spotlight-40@2x.png",
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "40x40"
    },
    {
      "filename" : "iPhone-Spotlight-40@3x.png",
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "40x40"
    },
    {
      "filename" : "iPhone-App-60@2x.png",
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "60x60"
    },
    {
      "filename" : "iPhone-App-60@3x.png",
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "60x60"
    },
    {
      "filename" : "iPad-Notification-20@1x.png",
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "20x20"
    },
    {
      "filename" : "iPad-Notification-20@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "20x20"
    },
    {
      "filename" : "iPad-Settings-29@1x.png",
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "29x29"
    },
    {
      "filename" : "iPad-Settings-29@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "29x29"
    },
    {
      "filename" : "iPad-Spotlight-40@1x.png",
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "40x40"
    },
    {
      "filename" : "iPad-Spotlight-40@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "40x40"
    },
    {
      "filename" : "iPad-Spotlight-76@1x.png",
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "76x76"
    },
    {
      "filename" : "iPad-Spotlight-76@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "76x76"
    },
    {
      "filename" : "iPad-Pro-83.5@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "83.5x83.5"
    },
    {
      "filename" : "App-Store-1024x1024.png",
      "idiom" : "ios-marketing",
      "scale" : "1x",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF
