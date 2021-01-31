import SwiftUI

struct ContentView: View {

    var body: some View {
        MapboxView()
            .centerCoordinate(
                .init(latitude: 33.0, longitude: -116.0)).zoomLevel(1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
