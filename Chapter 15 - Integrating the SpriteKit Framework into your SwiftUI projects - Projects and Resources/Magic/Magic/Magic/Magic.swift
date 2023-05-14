
import Foundation
import SwiftUI
import SpriteKit

class MagicScene: SKScene {
    var magic: SKEmitterNode!
    var wand: SKSpriteNode!

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        wand.position = CGPoint(x: touchLocation.x - 30, y: touchLocation.y + wand.frame.size.height / 2 - 20)
        ///make the skeleton appear
        if touchLocation.x < frame.size.width * 0.55 && touchLocation.y < frame.size.height * 0.12 {
            let skeleton = SKSpriteNode(imageNamed: "skeleton")
            skeleton.position = CGPoint(x: frame.size.width / 2 - 80, y: 175)
            skeleton.size = CGSize(width: skeleton.size.width / 2, height: skeleton.size.height / 2)
            addChild(skeleton)
            let moveAction = SKAction.move(to: CGPoint(x: frame.size.width / 2 - 50, y: frame.size.height / 2), duration: 2.0)
            skeleton.run(moveAction)
        }
        wand.zPosition = 2
        let trail = SKEmitterNode(fileNamed: "Magic.sks")!
        trail.particlePositionRange = CGVector(dx: 5, dy: 5)
        trail.particleSpeed = 50
        trail.position = CGPoint(x: wand.position.x - 40, y: wand.position.y + wand.frame.size.height / 2 + trail.particlePositionRange.dy)
        addChild(trail)
        let fadeAway = SKAction.fadeOut(withDuration: 1.2)
        trail.run(fadeAway) {
            trail.removeFromParent()
        }
    }
    override func didMove(to view: SKView) {
        let stone = SKSpriteNode(imageNamed: "stone")
        stone.position = CGPoint(x: frame.size.width / 2.3, y: frame.size.height / 2 - 150)
        stone.size = CGSize(width: 120, height: 175)
        stone.zRotation = CGFloat(Double.pi / 20)
        stone.zPosition = 2
           addChild(stone)
        guard let magic = SKEmitterNode(fileNamed: "Magic.sks") else { return }
        magic.particlePositionRange = CGVector(dx: 5, dy: 5)
        magic.particleSpeed = 50
        addChild(magic)
        self.magic = magic
        wand = SKSpriteNode(imageNamed: "wand")
        wand.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 3)
        wand.size = CGSize(width: 80, height: 180)
        addChild(wand)
    }
}

///make the wand glow with a fade animation
//        let glowAction = SKAction.sequence([
//                  SKAction.fadeAlpha(to: 0.5, duration: 0.5),
//                  SKAction.fadeAlpha(to: 1.0, duration: 0.5)
//              ])
//              wand.run(SKAction.repeatForever(glowAction))
