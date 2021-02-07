# Offline Map for Mobile

This repo describes how to build an Offline Map for mobile on iOS.  Local assets such as vector data, styles, glyphs and sprites are built into a sample iOS app.

## Features

* 100% local data (notice in the animation that WiFi is turned off at the beginning of the demo)
* Vector data built using https://openmaptiles.org
* Styling of the countries is from https://github.com/klokantech/mapbox-gl-js-offline-example
* Built upon https://github.com/klokantech/osm2vectortiles-ios, now an iOS app
can be built to have local vector data, styles, glyphs and sprites.

## Build

The [MapLibre Mobile SDK](https://github.com/maptiler/maplibre-gl-native-distribution) is installed via the [Swift Package Manager](https://developer.apple.com/documentation/swift_packages).

### GitHub Actions

* https://docs.github.com/actions/quickstart
* [![CI](https://github.com/roblabs/openmaptiles-ios-demo/workflows/CI/badge.svg)](https://github.com/roblabs/openmaptiles-ios-demo/actions?query=workflow%3ACI)

---

### Command Line Building

~~~
# Build
xcodebuild -scheme GeographyClass build

# Test
xcodebuild -scheme GeographyClass test \
  -destination 'platform=iOS Simulator,name=iPhone 8'

# Test without building
xcodebuild -scheme GeographyClass test-without-building   \
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

---

### Soft Proofing Tiles

You can Soft Proof your tiles before they are installed into mobile by using [Tileserver GL](https://github.com/maptiler/tileserver-gl#readme).

```
# Install `serve` from https://www.npmjs.com/package/serve
#  yarn global add serve   # do this once

cd OSM2VectorTiles

# Serve raw `.pbf` files using [serve](https://www.npmjs.com/package/serve)
# serve -v # version

# Be sure to open `http://localhost:5000` to confirm what is being served
serve --cors --listen 5000 # serve current directory; CORS; listen on port 5000

# Using a different server to hook into those raw tiles
alias tsgl='docker run --rm -it -v "$(pwd)":/data -p 8081:80 maptiler/tileserver-gl --verbose'

tsgl  # starts Tileserver GL using the file config.json
```

#### Zurich Sample

Using the Zurich Sample from Maptiler.  

See the [`metadata`](tileserver-gl/config.zurich.json) for details on
* how to run Tileserver-GL using `docker` or `npm`.
* How to fetch the Zurich MBTiles

##### Available Endpoints

* Useful for inspecting OpenMapTiles schema `v3` with a Basic style
  * Health — [http://localhost:8081/health](http://localhost:8081/health)
  * TileJSON — [http://localhost:8081/index.json](http://localhost:8081/index.json)
  * Styles — [http://localhost:8081/styles.json](http://localhost:8081/styles.json)
  * Fonts or Glyphs used in the style (not the fonts used by Mapbox) — [http://localhost:8081/fonts.json](http://localhost:8081/fonts.json)

```
tsgl --config tileserver-gl/config.zurich.json
```

#### Geography Class

Geography Class does not conform the OpenMapTiles schema `v3`.  You can inspect

##### Available Endpoints

* Health — [http://localhost:8081/health](http://localhost:8081/health)
* TileJSON — [http://localhost:8081/index.json](http://localhost:8081/index.json)
* Styles — [http://localhost:8081/styles.json](http://localhost:8081/styles.json)
* Fonts or Glyphs used in the style (not the fonts used by Mapbox) — [http://localhost:8081/fonts.json](http://localhost:8081/fonts.json)
* Sprites  for this particular style — [http://localhost:5000/sprites/bright-v8@2x.png](http://localhost:5000/sprites/bright-v8@2x.png)

```
tsgl --config tileserver-gl/config.geography-class.json
```

---

![geography-class](geography-class.gif)

* (QuickTime has a bug when screen recording; as it still shows WiFi service is on, when it indeed is off)

---

### Change Log

* Jan 30, 2021
  * Convert to Offline Maps with SwiftUI.  Local style with local tiles using the protocol `asset://`
  * branch: `mapbox-maps-ios-v10` updated with MapboxMaps Library from https://github.com/mapbox/mapbox-maps-ios
  * Rename project to Geography Class
  * Minimum iOS is 13.0
  * Tested with Xcode 12.4 & 12.5
* Jan 26, 2021
  * Update to MapLibre.  https://github.com/maptiler/maplibre-gl-native-distribution/pull/2
  * Remove references to Carthage.  See the branch `carthage`, if needed.
* Jun 24, 2020
  * Updated notes on how to use Tileserver GL
* Jun 17, 2020
  * Add `config.json` for use by [Tileserver GL](https://github.com/maptiler/tileserver-gl#readme)
* Jun 2, 2020
  * Update to use Carthage only; removed dependency on Cocoapods
  * Upgrade to Xcode 11.5
  * Upgrade to Mapbox 5.9 & mapbox-events-ios 0.10
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
