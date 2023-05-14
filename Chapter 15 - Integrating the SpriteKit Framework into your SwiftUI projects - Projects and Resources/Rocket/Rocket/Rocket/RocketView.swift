
import SwiftUI

struct RocketView: View {
        @State private var rocketAndFireOffset: CGFloat = 0

        var body: some View {
            ZStack {
                FireView().rotationEffect(Angle(degrees: 180.0)).offset(y: 60)
                     ///move the rocket upwards by changing y offset
                    .offset(x: 0, y: -rocketAndFireOffset)
                    /// position the fire at the bottom center of the screen
                    .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height)
                Image("rocket")
                    .resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 200)
                     ///move the rocket upwards by changing y offset
                    .offset(x: 0, y: -rocketAndFireOffset)
                    ///position the rocket at the bottom center of the screen
                    .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height)
                ///rotate the fire and offset it so its under the bottom of the rocket


            } .animation(Animation.linear(duration: 8).repeatForever(autoreverses: false),value: rocketAndFireOffset) // increase the duration of the animation
                .onAppear {
                    rocketAndFireOffset = UIScreen.main.bounds.height * 1.3 // move the rocket off the top of the screen, by increasing the offset
            }
        }
    }





struct RocketView_Previews: PreviewProvider {
    static var previews: some View {
        RocketView()
    }
}
