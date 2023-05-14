
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("graveyard")
                .resizable()
                .scaledToFill().frame(width: 500, height: 900)
            MagicView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
