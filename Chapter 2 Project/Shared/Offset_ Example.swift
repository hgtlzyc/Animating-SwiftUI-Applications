//
//  Offset_ Example.swift
//  Chapter2
//
//  Created by Stephen DeStefano on 4/26/22.
//

import SwiftUI

struct Offset_Example: View {
    @State private var moveRight = false
        var body: some View {
           //MARK: - ANIMATE OFFSET
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 75, height: 75)
                    .offset(x: moveRight ? 150 : 0, y: 350 )
                    .animation(Animation.default, value: moveRight)
                Spacer()
                Button("Animate") {
                    moveRight.toggle()
                }.font(.title2)
            }
        }
    } 

struct Offset__Example_Previews: PreviewProvider {
    static var previews: some View {
        Offset_Example()
    }
}
