//
//  Corner_Radius_Example.swift
//  Chapter2
//
//  Created by Stephen DeStefano on 4/26/22.
//

import SwiftUI

struct Corner_Radius_Example: View {
    @State private var animateCornerRadius = false
    
    var body: some View {
        //MARK: - ANIMATE THE CORNER RADIUS
        VStack{
            Text("ANIMATE CORNER RADIUS").font(.title).bold()
                .padding(.top, 30)
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 150, height: 150)
            .cornerRadius(animateCornerRadius ? 0 : 75)
            .animation(.default, value: animateCornerRadius)
            .padding(.bottom, 20)
            Button("Animate Corner Radius") {
                animateCornerRadius.toggle()
            }
        }.font(.title2)
    }
}

struct Corner_Radius_Example_Previews: PreviewProvider {
    static var previews: some View {
        Corner_Radius_Example()
    }
}
