
import SwiftUI
import SpriteKit

struct RainView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<RainView>) -> SKView {
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        view.backgroundColor = .clear
        let scene = SKScene(size: CGSize(width: 400, height: 600))
        scene.backgroundColor = UIColor.clear
        guard let rain = SKEmitterNode(fileNamed: "Rain.sks") else { return SKView() }
        rain.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        rain.particlePositionRange = CGVector(dx: 500, dy: 1100)
        rain.xScale = 0.5
        
        ///add the rain to the scene
        scene.addChild(rain)
        view.presentScene(scene)
        return view
    }
    func updateUIView(_ uiView: SKView, context: UIViewRepresentableContext<RainView>) {
        /// Update the rain in this function if you need to
    }
}

struct RainView_Previews: PreviewProvider {
    static var previews: some View {
        RainView()
    }
}
