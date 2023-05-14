

import SwiftUI

struct DropView: View {
    @State private var dropScale: CGFloat = 0.1
    @State private var xOffsets = (0..<300).map { _ in CGFloat.random(in: -150...UIScreen.main.bounds.width)}
    @State private var yOffsets = (0..<240).map { _ in CGFloat.random(in: UIScreen.main.bounds.height/5...UIScreen.main.bounds.height)}
    @State private var durations = (0..<150).map { _ in Double.random(in: 0.3...1.0)}
    
    var body: some View {
        //Color.clear.edgesIgnoringSafeArea(.all)
            ForEach(0..<150) { index in
                Circle()
                    .fill(Color.white)
                        .opacity(0.6)
                        .blur(radius: 3)
                    .frame(width: 15, height: 15)
                    .scaleEffect(dropScale)
                    .rotation3DEffect(Angle(degrees: 80.0), axis: (x: 1, y: 0, z: 0))
                    .offset(x: xOffsets[index] - 140, y: yOffsets[index])
                    .animation(Animation.easeInOut(duration: durations[index]).repeatForever(autoreverses: true), value: dropScale)
                    .onAppear {
                        dropScale = 0.8
                    }
            }
    }
}

struct DropView_Previews: PreviewProvider {
    static var previews: some View {
        DropView()
    }
}
