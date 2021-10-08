import SwiftUI

struct ContentView: View {

    var body: some View {
        MapboxView()
            .centerCoordinate(
            .init(latitude: 33.0, longitude: -116.0)).zoomLevel(7)
            .setStyle("asset://styles/geography-class-local.json")

/** Token Free Styles
            .setStyle("https://raw.githubusercontent.com/roblabs/openmaptiles-ios-demo/master/OSM2VectorTiles/styles/geography-class.GitHub.json")
            .setStyle("https://raw.githubusercontent.com/roblabs/xyz-raster-sources/master/styles/naturalearthtiles.json")
            .setStyle("https://raw.githubusercontent.com/roblabs/xyz-raster-sources/master/styles/tileservice-charts-noaa-gov.json")
            .setStyle("https://raw.githubusercontent.com/roblabs/xyz-raster-sources/master/styles/arcgis-world-imagery.json")
            .setStyle("https://raw.githubusercontent.com/roblabs/xyz-raster-sources/master/styles/stamen-multi-rasters.json")
            .setStyle("https://demotiles.maplibre.org/style.json")
 */
        
/** Mapbox styles to use
 
            /// Mabpox example
           .setStyle("mapbox://styles/examples/cke97f49z5rlg19l310b7uu7j")
 
            /// Mapbox Streets is a general-purpose style with detailed road and transit networks.
            .setStyle("mapbox://styles/mapbox/streets-v11")

            /// Mapbox Outdoors is a general-purpose style tailored to outdoor activities.
            .setStyle("mapbox://styles/mapbox/outdoors-v11")

            /// Mapbox Light is a subtle, light-colored backdrop for data visualizations.
            .setStyle("mapbox://styles/mapbox/light-v10")

            /// Mapbox Dark is a subtle, dark-colored backdrop for data visualizations.
            .setStyle("mapbox://styles/mapbox/dark-v10")

            /// The Mapbox Satellite style is a base-map of high-resolution satellite and aerial imagery.
            .setStyle("mapbox://styles/mapbox/satellite-v9")

            /// The Mapbox Satellite Streets style combines the high-resolution satellite and aerial imagery
            /// of Mapbox Satellite with unobtrusive labels and translucent roads from Mapbox Streets.
            .setStyle("mapbox://styles/mapbox/satellite-streets-v11")
*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
