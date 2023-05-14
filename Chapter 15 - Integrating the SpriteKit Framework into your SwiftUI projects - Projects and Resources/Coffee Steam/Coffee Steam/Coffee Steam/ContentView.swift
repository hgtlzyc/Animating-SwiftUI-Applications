
import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable().frame(width: 600, height: 900)
                .aspectRatio(contentMode: .fit)
            ZStack {
                ///adding the whole cup
                Image("cup")
                    .resizable().frame(width: 350, height: 300)
                    .aspectRatio(contentMode: .fit)
                ///calling and positioning the SmokeView
                CoffeeSteam().offset(x: 15, y: 80)
                ///adding the altered cup
                Image("cup 2")
                    .resizable().frame(width: 350, height: 300)
                    .aspectRatio(contentMode: .fit)
            }.offset(y: 250)
        }
    }
}

struct CoffeeSteam: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<CoffeeSteam>) -> SKView {
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        view.backgroundColor = .clear
        let scene = SKScene(size: CGSize(width: 400, height: 600))
        ///set the scenes background color to clear - we only want the particles seen
        scene.backgroundColor = UIColor.clear
        guard let steam = SKEmitterNode(fileNamed: "CoffeeSteam.sks") else { return SKView() }
        steam.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        
        /// set the blend mode - scale - range
        steam.particleBlendMode = .screen
        steam.particleScale = 0.01
        steam.particleScaleRange = 0.05
       
        ///add the smoke to the scene
        scene.addChild(steam)
        view.presentScene(scene)
        return view
    }
    func updateUIView(_ uiView: SKView, context: UIViewRepresentableContext<CoffeeSteam>) {
        /// Update the steam in this function if you need to
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
