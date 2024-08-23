import Combine
import SwiftUI

struct ContentView: View {
    @State var searcher = BitlinkSearcher()

    var body: some View {
        VStack {
            Text(searcher.lastDistance.displayName)
                .font(.largeTitle)
            Text(String(searcher.lastAccurancy ?? 0.0) + "m")
        }
        .onAppear() {
            searcher.startScanning()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
