//
//  Opacity_ Example.swift
//  Chapter2
//
//  Created by Stephen DeStefano on 4/26/22.
//

import SwiftUI

struct Opacity__Example: View {
    @State private var appear = true 
       var body: some View {
   //MARK: - ANIMATE OPACITY
           VStack{
               Text("Appear/Disappear")
                   .font(.title).bold()
               Circle()
                   .foregroundColor(.purple)
                   .opacity(appear ? 1 : 0)
                   .animation(.easeIn, value: appear)
                   .frame(height: 175)
               Button("Animate") {
                   appear.toggle()
               }.font(.title2)
               //MARK: - OVERLAPPING OPACITY
               VStack{
                   Text("Overlapping Opacity").bold()
                       .font(.title)
                   Circle()
                       .foregroundColor(.yellow)
                       .frame(height: 100)
                       .opacity(0.5)
                   Circle()
                       .foregroundColor(.red)
                       .frame(height: 100)
                       .opacity(0.5)
                       .padding(-60)
               }.padding(60)
           }
       }
   }

struct Opacity__Example_Previews: PreviewProvider {
    static var previews: some View {
        Opacity__Example()
    }
}
