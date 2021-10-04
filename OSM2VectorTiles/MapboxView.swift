import SwiftUI
import Mapbox
import OSLog
import MapViewOSLogExtensions

struct MapboxView: UIViewRepresentable {
    var oslog = OSLog(subsystem: OSLog.subsystemMapview, category: OSLog.categoryMapview)
    private let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: MGLStyle.streetsStyleURL)
    
    // MARK: - Configuring UIViewRepresentable protocol
    
    init() {
        OSLog.mapView(.event, "🎬 MapView init()")
    }
    
    func makeUIView(context: Context) -> MGLMapView {
        OSLog.mapView(.event, "🖼 frame: \(mapView.frame)")
        mapView.delegate = context.coordinator
        mapView.logoView.isHidden = true
        mapView.debugMask = [MGLMapDebugMaskOptions.tileBoundariesMask, MGLMapDebugMaskOptions.tileInfoMask]
        
        print("# Use this log output to open the folder to `cache.db` in macOS Finder")
        print("  open \"\(NSHomeDirectory().mapboxCacheDBPath)\"")
        print("")

        return mapView
    }
    
    func updateUIView(_ uiView: MGLMapView, context: Context) {
        var localStyle = "asset://styles/geography-class.GitHub.json"
//        localStyle = "https://raw.githubusercontent.com/roblabs/openmaptiles-ios-demo/master/OSM2VectorTiles/styles/geography-class.GitHub.json"
//        localStyle = "https://raw.githubusercontent.com/roblabs/xyz-raster-sources/master/styles/naturalearthtiles.json"
//        localStyle = "https://raw.githubusercontent.com/roblabs/xyz-raster-sources/master/styles/tileservice-charts-noaa-gov.json"
//        localStyle = "https://raw.githubusercontent.com/roblabs/xyz-raster-sources/master/styles/arcgis-world-imagery.json"
//        localStyle = "https://raw.githubusercontent.com/roblabs/xyz-raster-sources/master/styles/stamen-multi-rasters.json"
//        localStyle = "https://demotiles.maplibre.org/style.json"
        let _ = setStyle(localStyle)
        OSLog.mapView(.event, "🗺 style: \(String(describing: mapView.styleURL!))")
    }
    
    func makeCoordinator() -> MapboxView.Coordinator {
        Coordinator(self)
    }
    
    // MARK: - Configuring MGLMapView
    
    /// Set the Map Style by string
    /// - parameter styleURL
    func setStyle(_ styleURL: String) -> MapboxView {
        mapView.styleURL = URL(string: styleURL)
        return self
    }
    
    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapboxView {
        mapView.centerCoordinate = centerCoordinate
        return self
    }
    
    func zoomLevel(_ zoomLevel: Double) -> MapboxView {
        mapView.zoomLevel = zoomLevel
        return self
    }
    
    // MARK: - Implementing MGLMapViewDelegate
    
    final class Coordinator: NSObject, MGLMapViewDelegate {
        var control: MapboxView
        
        init(_ control: MapboxView) {
            OSLog.mapView(.event, OSLog.mapEvents.initDelegate.description)
            self.control = control
        }

        /// Log events 🦮100. WillStartLoadingMap
        func mapViewWillStartLoadingMap(_ mapView: MGLMapView) {
            OSLog.mapView(.event, OSLog.mapEvents.WillStartLoadingMap.description)
        }

        /// Log events 🦮1. WillStartRenderingMap
        func mapViewWillStartRenderingMap(_ mapView: MGLMapView) {
            OSLog.mapView(.event, OSLog.mapEvents.WillStartRenderingMap.description)
        }

        /// Log events 🦮2. DidFinishLoadingStyle
        func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
            OSLog.mapView(.event, OSLog.mapEvents.DidFinishLoadingStyle.description)
        }
        
        /// Log events 🦮3. DidFinishRenderingMap
        func mapViewDidFinishRenderingMap(_ mapView: MGLMapView, fullyRendered: Bool) {
            OSLog.mapView(.event, OSLog.mapEvents.DidFinishRenderingMap.description)
        }

        /// Log events 🦮4. DidFinishLoadingMap
        func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
            OSLog.mapView(.event, OSLog.mapEvents.DidFinishLoadingMap.description)
        }
        
        /// Log events 🦮5. DidBecomeIdle
        func mapViewDidBecomeIdle(_ mapView: MGLMapView) {
            OSLog.mapView(.event, OSLog.mapEvents.DidBecomeIdle.description)
        }
        
        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }
         
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }
    }
}
