Building upon https://github.com/klokantech/osm2vectortiles-ios, now an iOS app
can be built to have local vector data, styles, glyphs and sprites.

## Features

* 100% local data (notice in the animation that WiFi is turned off at the beginning of the demo)
* Vector data built using https://openmaptiles.org
* Styling of the countries is from https://github.com/klokantech/mapbox-gl-js-offline-example

## Build

* Install `carthage` via https://github.com/Carthage/Carthage
  * `# brew install carthage`  
  * `carthage update`

### Command Line Building

~~~
# Build
xcodebuild -scheme OSM2VectorTiles build

# Test
xcodebuild -scheme OSM2VectorTiles test \
  -destination 'platform=iOS Simulator,name=iPhone 8'

# Test without building
xcodebuild -scheme OSM2VectorTiles test-without-building   \
  -destination 'platform=iOS Simulator,name=iPhone 11 Pro' \
  -destination 'platform=iOS,name=iPhone 8' \
~~~

#### Mapbox token

* Since the Map vector data is local, its technically not needed to have an access token
  * But to be safe, here are notes on how to
* Following notes from https://docs.mapbox.com/help/troubleshooting/private-access-token-android-and-ios/
> Create a new plain text file containing your access token, named either .mapbox or mapbox. To avoid accidentally committing this file to an open-source project, either you can save it to a location outside your project's version-controlled directory, or you can add this file to your project’s .gitignore file.

* Then open the Project file

~~~
open openmaptiles-ios-demo.xcodeproj
~~~

## Architecture

* All assets are local and are accessed by Mapbox GL by the `asset://` URI.

```
"sources": {
    "countries": {
        "type": "vector",
        "tiles": [
            "asset://geography-class.osm2vectortiles/{z}/{x}/{y}.pbf"
        ]
    }
},
"sprite": "asset://sprites/bright-v8",
"glyphs": "asset://glyphs/{fontstack}/{range}.pbf",
```


![geography-class](geography-class.gif)

* (QuickTime has a bug when screen recording; as it still shows WiFi service is on, when it indeed is off)

---

### Change Log

* Jun 2, 2020
  * Update to use Carthage only; removed dependency on Cocoapods
  * Upgrade to Xcode 11.5
  * Uprade to Mapbox 5.9 & mapbox-events-ios 0.10
  * Add Xcode Bots & Continuous Integration scripts
* Dec 13, 2019
  * Move from Cocoapods to Carthage
  * Upgrade to Xcode 11.3
  * Uprade to Mapbox 5.5
  * Add local, private Mapbox Token
* Nov 19, 2019
  * Upgrade to Xcode 10.1
* Jan 30, 2017
  * upgrade to Mapbox 3.4.1 & Podfile
* 2016 — Initial Version
