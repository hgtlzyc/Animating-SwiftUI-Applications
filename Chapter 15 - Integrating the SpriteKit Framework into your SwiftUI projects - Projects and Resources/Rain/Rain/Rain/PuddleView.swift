
import SwiftUI

struct PuddleView: View {
    @State private var scaleX: CGFloat = 0.5
    @State private var scaleY: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(LinearGradient(gradient: Gradient(colors: [.white,  .black,.gray, .white,.black]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(0.5)
                .blur(radius: 5)
                .frame(width: 600, height: 500)
                .scaleEffect(x: scaleX, y: scaleY, anchor: .center)
                .animation(Animation.easeInOut(duration: 8.0).repeatForever(autoreverses: true),value: scaleX)
            
            //creates the ripple
                .overlay(
                    Capsule()
                        .stroke(Color.gray, lineWidth: 5)
                        .opacity(0.5 )
                        .frame(width: 350, height: 200)
                        .offset(x: 0, y: -15)
                        .scaleEffect(x: scaleX + 0.03, y: scaleY + 0.03, anchor: .center)
                        .animation(Animation.easeInOut(duration: 8.0).repeatForever(autoreverses: true), value: scaleY)
                        .onAppear {
                            scaleX = 0.54
                            scaleY = 0.6
                        }).rotation3DEffect(Angle(degrees: 81.0), axis: (x: 1, y: 0, z: 0))
            
        } .offset(x: -50, y: 300)
            .onAppear {
                scaleX = 0.55
                scaleY = 0.6
            }
    }
}

struct PuddleView_Previews: PreviewProvider {
    static var previews: some View {
        PuddleView()
    }
}




