
import SwiftUI
import SpriteKit

struct FireView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<FireView>) -> SKView {
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        ///set the view background to clear - we set the background in the ContentView
        view.backgroundColor = .clear
        let scene = SKScene(size: CGSize(width: 400, height: 600))
        ///set the scenes background color to clear - we only want the particles seen
        ///You can also use any other valid color like UIColor.lightGray, UIColor.green, UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5) or any other UIColor initializer.
        scene.backgroundColor = UIColor.clear
        guard let fire = SKEmitterNode(fileNamed: "Fire.sks") else { return SKView() }
        fire.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        ///use the particlePositionRange property to constrain the fire particles so they are not so wide and can fit under the rockets exhaust
        fire.particlePositionRange = CGVector(dx: 5, dy: 0)
       
        ///add the fire to the scene
        scene.addChild(fire)
        view.presentScene(scene)
        return view
    }
    func updateUIView(_ uiView: SKView, context: UIViewRepresentableContext<FireView>) {
        /// Update the smoke in this function if you need to
    }
}

struct FireView_Previews: PreviewProvider {
    static var previews: some View {
        FireView()
    }
}
