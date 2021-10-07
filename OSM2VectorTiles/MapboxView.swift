import SwiftUI
import MapboxMaps

struct MapboxView: UIViewRepresentable {

    // MARK: - Configuring UIViewRepresentable protocol
    var mapView = MapView(frame: .zero, mapInitOptions: MapInitOptions(resourceOptions: ResourceOptions(accessToken: "pk.accessToken")))
    
    func makeUIView(context: Context) -> MapView {
        print("# Use this log output to open the folder to `cache.db` in macOS Finder")
        print("  open \"\(NSHomeDirectory().mapboxCacheDBPath)\"")
        return mapView
    }
    
    func updateUIView(_ uiView: MapView, context: Context) {
    }
    
    // MARK: - Configuring MapboxView
    
    /// Set the Map Style by string
    /// - parameter styleURL
    func setStyle(_ styleURL: String) -> MapboxView {
        // Create a URL for a custom style created in Mapbox Studio.
        guard let customStyleURI = StyleURI(rawValue: styleURL) else {
            fatalError("Style URI is invalid")
        }
        
        mapView.mapboxMap.style.uri = customStyleURI
        
        return self
    }
    
    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapboxView {
        mapView.mapboxMap.setCamera(to: CameraOptions(center: centerCoordinate))
        return self
    }
    
    func zoomLevel(_ zoom: CGFloat) -> MapboxView {
        mapView.mapboxMap.setCamera(to: CameraOptions(zoom: zoom))
        return self
    }
    
    // MARK: - Implementing MGLMapViewDelegate
//    
//    final class Coordinator: NSObject, MBMMapViewDelegate {
//        var control: MapboxView
//        
//        init(_ control: MapboxView) {
//            self.control = control
//        }
//    }
}
