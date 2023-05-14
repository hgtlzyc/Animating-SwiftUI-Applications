import SpriteKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("street")
                   .resizable()
                   .scaledToFill()
           /// Play around with the blend mode, by adding it, you can help blend the puddle view into the street image. and there are many blend options available for the initializer.
            PuddleView()//.blendMode(.hardLight)
            RainView()
            DropView()
            RainView()
        }.edgesIgnoringSafeArea(.all)
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

