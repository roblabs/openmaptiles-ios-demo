import SwiftUI
import MapboxMaps

struct MapboxView: UIViewRepresentable {

    var mapView = MapView(with: .zero, resourceOptions: ResourceOptions(accessToken: "token"))
    
    // MARK: - Configuring UIViewRepresentable protocol
    
    func makeUIView(context: Context) -> MapView {
        return mapView
    }
    
    func updateUIView(_ uiView: MapView, context: Context) {
        mapView.style.styleURL = StyleURL.dark
        mapView.update { (mapOptions) in
            mapOptions.ornaments.showsScale = true
        }
        style = "http://10.0.1.3:5000/styles/style.json"

        mapView.style.styleURL = StyleURL.custom(url: URL(string: style)!)
    }
    
    func makeCoordinator() -> MapboxView.Coordinator {
        Coordinator(self)
    }
    
    // MARK: - Configuring MapboxView
    
    /// Set the Map Style by string
    /// - parameter styleURL
    func setStyle(_ styleURL: String) -> MapboxView {
        mapView.style.styleURL = StyleURL.custom(url: URL(string: styleURL)!)
        return self
    }
    
    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapboxView {
        mapView.cameraManager.setCamera(to: CameraOptions(center: centerCoordinate))
        return self
    }
    
    func zoomLevel(_ zoom: CGFloat) -> MapboxView {
        mapView.cameraManager.setCamera(to: CameraOptions(zoom: zoom))
        return self
    }
    
    // MARK: - Implementing MGLMapViewDelegate
    
    final class Coordinator: NSObject, MBMMapViewDelegate {
        var control: MapboxView
        
        init(_ control: MapboxView) {
            self.control = control
        }
    }
}
