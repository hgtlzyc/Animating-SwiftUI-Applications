//
//  ContentView.swift
//  Pipe Smoke
//
//  Created by Stephen DeStefano on 2/3/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        ZStack {
            ///adding the pipe image and setting the size and scale to fit on it
            Image("pipe")
                .resizable().frame(width: 350, height: 350)
                .scaledToFit()
            ///calling and positioning the SmokeView
            SmokeView()
            .offset(x: -140, y: 105)
        }.background(Image("background"))
    }
}

struct SmokeView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<SmokeView>) -> SKView {
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        view.backgroundColor = .clear
        let scene = SKScene(size: CGSize(width: 400, height: 600))
        scene.backgroundColor = UIColor.clear
        guard let smoke = SKEmitterNode(fileNamed: "Smoke.sks") else { return SKView() }
        smoke.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        
        // set the blend mode - scale - range
        smoke.particleBlendMode = .screen
        smoke.particleScale = 0.01
        smoke.particleScaleRange = 0.05
       
        ///add the smoke to the scene
        scene.addChild(smoke)
        view.presentScene(scene)
        return view
    }
    func updateUIView(_ uiView: SKView, context: UIViewRepresentableContext<SmokeView>) {
        /// Update the smoke in this function if you need to
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
