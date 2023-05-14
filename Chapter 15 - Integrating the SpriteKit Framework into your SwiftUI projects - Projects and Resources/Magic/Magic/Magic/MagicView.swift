
import SwiftUI
import SpriteKit

struct MagicView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MagicView>) -> SKView {
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        view.backgroundColor = .clear
        let scene = MagicScene(size: CGSize(width: 900, height: 600))
        scene.backgroundColor = UIColor.clear
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
        return view
    }

    func updateUIView(_ uiView: SKView, context: UIViewRepresentableContext<MagicView>) {
    }
}


struct MagicView_Previews: PreviewProvider {
    static var previews: some View {
        MagicView()
    }
}
