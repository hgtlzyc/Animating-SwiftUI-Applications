//
//  Trim_Example.swift
//  Chapter2
//
//  Created by Stephen DeStefano on 4/26/22.
//

import SwiftUI

struct Trim_Example: View {
    @State private var animateTrim = false
    @State private var circleTrim: CGFloat = 1.0
    
    var body: some View {
        //MARK: - ANIMATE THE TRIM MODIFIER OF A CIRCLE
        VStack {
            Text("ANIMATE TRIM").font(.title).bold()
                .padding(.top, 10)
            Circle()
                .trim(from: 0, to: circleTrim)
                .stroke(Color.red, style: StrokeStyle(lineWidth: 30, lineCap: CGLineCap.round))
                .frame(height: 150)
                .rotationEffect(.degrees(180))
                .animation(.default, value: animateTrim)
                .padding(.bottom, 20)
            Button("Animate Trim") {
                animateTrim.toggle()
                circleTrim = animateTrim ? 0.25 : 1
            }
        }.font(.title2)
    }
}

struct Trim_Example_Previews: PreviewProvider {
    static var previews: some View {
        Trim_Example()
    }
}
