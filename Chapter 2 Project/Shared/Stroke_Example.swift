//
//  Stroke_Example.swift
//  Chapter2
//
//  Created by Stephen DeStefano on 4/26/22.
//

import SwiftUI

struct Stroke_Example: View {
    @State private var animateStroke = false
    var body: some View {
        //MARK: - ANIMATE THE STROKE OF THE ROUNDED RECT
        VStack{
            Text("ANIMATE STROKE").font(.title).bold()
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.purple, style: StrokeStyle(lineWidth: animateStroke ? 25 : 1))
                .frame(width: 100, height: 100)
                .animation(.default, value: animateStroke)
            Button("Animate Stroke") {
                animateStroke.toggle()
            }
        }.font(.title2)
    }
}

struct Stroke_Example_Previews: PreviewProvider {
    static var previews: some View {
        Stroke_Example()
    }
}
