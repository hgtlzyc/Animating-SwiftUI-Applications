import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack  {
            WeView()
            HeartView()
            SwiftUILogoView()
        }.background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
