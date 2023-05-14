
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ///add the RocketView to the scene
            RocketView()
        }.background(Image("background")
            .resizable()
            .scaledToFill().edgesIgnoringSafeArea(.all))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
