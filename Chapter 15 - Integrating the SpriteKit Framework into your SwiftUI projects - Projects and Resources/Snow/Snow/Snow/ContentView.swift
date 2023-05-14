import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable().frame(width: 600, height: 900)
                .aspectRatio(contentMode: .fit)
            Branches()
            SnowView()
        }
    }
}

struct Branches: View {
    @State private var anglesX = [Double](repeating: 0, count: 25)
    @State private var anglesY = [Double](repeating: 0, count: 25)
    @State private var anglesZ = [Double](repeating: 0, count: 25)
    @State private var positions = [CGPoint](repeating: .zero, count: 25)
    @State private var durations = [Double](repeating: 0, count: 25)

    var body: some View {
        ZStack {
            ForEach(0..<8) { index in
                Image("branch")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle(degrees: anglesX[index]))
                    .rotationEffect(Angle(degrees: anglesY[index]), anchor: .center)
                    .rotationEffect(Angle(degrees: anglesZ[index]), anchor: .center)
                    .position(positions[index])
                    .frame(width: 200, height: 700)
                    .animation(
                        Animation.easeInOut(duration: durations[index])
                            .repeatForever(autoreverses: true), value: anglesX)
                    .onAppear {
                        anglesX[index] = Double.random(in: 2...4)
                        anglesY[index] = Double.random(in: 2...3)
                        anglesZ[index] = Double.random(in: 1...3)
                        positions[index] = CGPoint(x: CGFloat.random(in: 0...10), y: CGFloat.random(in: 0...5))
                        durations[index] = Double.random(in: 3...5)
                    }
            }
        } .offset(x: 50, y: 200)

        ZStack {
            ForEach(0..<10) { index in
                Image("branch")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle(degrees: anglesX[index]))
                    .rotationEffect(Angle(degrees: anglesY[index]), anchor: .center)
                    .rotationEffect(Angle(degrees: anglesZ[index]), anchor: .center)
                    .position(positions[index])
                    .frame(width: 200, height: 700)
                    .offset(x: 50, y: 200)
                    .animation(
                        Animation.easeInOut(duration: durations[index])
                            .repeatForever(autoreverses: true),value: anglesY)
                    .onAppear {
                        anglesX[index] = Double.random(in: 3...4)
                        anglesY[index] = Double.random(in: 2...5)
                        anglesZ[index] = Double.random(in: 1...4)
                        positions[index] = CGPoint(x: CGFloat.random(in: 0...10), y: CGFloat.random(in: 0...14))
                        durations[index] = Double.random(in: 2...6)
                    }
            }
        }.offset(x: -80, y: -156)

        ZStack {
            ForEach(0..<15) { index in
                Image("branch")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle(degrees: anglesX[index]))
                    .rotationEffect(Angle(degrees: anglesY[index]), anchor: .center)
                    .rotationEffect(Angle(degrees: anglesZ[index]), anchor: .center)
                    .position(positions[index])
                    .frame(width: 200, height: 700)
                    .offset(x: 50, y: 200)
                    .animation(
                        Animation.easeInOut(duration: durations[index])
                            .repeatForever(autoreverses: true)
                        ,value: anglesZ)
                    .onAppear {
                        anglesX[index] = Double.random(in: 1...3)
                        anglesY[index] = Double.random(in: 2...4)
                        anglesZ[index] = Double.random(in: 3...6)
                        positions[index] = CGPoint(x: CGFloat.random(in: 0...10), y: CGFloat.random(in: 0...8))
                        durations[index] = Double.random(in: 4...6)
                    }
            }
        }.offset(x: -120, y: 0)
        
        ZStack {
            ForEach(0..<7) { index in
                Image("branch")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle(degrees: anglesX[index]))
                    .rotationEffect(Angle(degrees: anglesY[index]), anchor: .center)
                    .rotationEffect(Angle(degrees: anglesZ[index]), anchor: .center)
                    .position(positions[index])
                    .frame(width: 200, height: 700)
                    .offset(x: 50, y: 200)
                    .animation(
                        Animation.easeInOut(duration: durations[index])
                            .repeatForever(autoreverses: true)
                        ,value: anglesX)
                    .onAppear {
                        anglesX[index] = Double.random(in: 1...3)
                        anglesY[index] = Double.random(in: 2...3)
                        anglesZ[index] = Double.random(in: 3...5)
                        positions[index] = CGPoint(x: CGFloat.random(in: 0...10), y: CGFloat.random(in: 0...12))
                        durations[index] = Double.random(in: 4...6)
                    }
            }
        }.offset(x: -100, y: 160)
        
        ZStack {
            ForEach(0..<7) { index in
                Image("branch")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(Angle(degrees: anglesX[index]))
                    .rotationEffect(Angle(degrees: anglesY[index]), anchor: .center)
                    .rotationEffect(Angle(degrees: anglesZ[index]), anchor: .center)
                    .position(positions[index])
                    .frame(width: 180, height: 700)
                    .offset(x: 50, y: 200)
                    .animation(
                        Animation.easeInOut(duration: durations[index])
                            .repeatForever(autoreverses: true)
                        ,value: anglesY)
                    .onAppear {
                        anglesX[index] = Double.random(in: 0...2)
                        anglesY[index] = Double.random(in: 0...3)
                        anglesZ[index] = Double.random(in: 0...1)
                        positions[index] = CGPoint(x: CGFloat.random(in: 0...10), y: CGFloat.random(in: 0...12))
                        durations[index] = Double.random(in: 3...6)
                    }
            }
        }.offset(x: 10, y: 100)

    }
}



struct SnowView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<SnowView>) -> SKView {
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        view.backgroundColor = .clear
        let scene = SKScene(size: CGSize(width: 500, height: 800))
        scene.backgroundColor = UIColor.clear
        guard let snow = SKEmitterNode(fileNamed: "Snow.sks") else { return SKView() }
        guard let blustery = SKEmitterNode(fileNamed: "Blustery.sks") else { return SKView() }
        
        //snow sks file
        snow.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        ///use the particlePositionRange property to spread the snow particles on the screen for the x and y axis
        snow.particlePositionRange = CGVector(dx: 500, dy: 900)
        
        //blustery sks file
        blustery.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        ///use the particlePositionRange property to spread the snow particles on the screen for the x and y axis
        blustery.particlePositionRange = CGVector(dx: 500, dy: 900)
        
        ///add the snow to the scene
        scene.addChild(snow)
        scene.addChild(blustery)
        view.presentScene(scene)
        return view
    }
    func updateUIView(_ uiView: SKView, context: UIViewRepresentableContext<SnowView>) {
        /// Update the snow in this function if you need to
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
