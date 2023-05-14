//
//  Hue_Rotation_Example.swift
//  Chapter2
//
//  Created by Stephen DeStefano on 4/26/22.
//

import SwiftUI

struct Hue_Rotation_Example: View {
    @State private var hueRotate = false
           var body: some View {
           //MARK: - ANIMATE HUE ROTATION
           VStack(spacing: 20) {
               Text("ANIMATE HUE").font(.title2).bold()
               // rotate the colors and stop halfway around the color wheel
               RoundedRectangle(cornerRadius: 25)
                   .frame(width: 200, height: 200)
                   .foregroundColor(.red)
                   .hueRotation(Angle.degrees(hueRotate ? 180 : 0))
                   .animation(.easeInOut(duration: 2), value: hueRotate)
               // rotate the colors around the color wheel one full revolution (360 degrees)
               Divider().background(Color.black)
               Text("ANIMATE HUE WITH GRADIENT").font(.title2).bold()
               AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center)
                   .hueRotation(Angle.degrees(hueRotate ? 360 : 0))
                   .animation(.easeInOut(duration: 2), value: hueRotate)
                   .mask(Circle())
                   .frame(width: 200, height: 200)
               Button("Animate") {
                   hueRotate.toggle()
               }
               .font(.title)
           }
       }
   }

struct Hue_Rotation_Example_Previews: PreviewProvider {
    static var previews: some View {
        Hue_Rotation_Example()
    }
}
