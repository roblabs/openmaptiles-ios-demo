import SwiftUI

struct ContentView: View {

    var body: some View {
        MapboxView()
            .centerCoordinate(
                .init(latitude: 32.713103, longitude: -117.171231)).zoomLevel(7)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
