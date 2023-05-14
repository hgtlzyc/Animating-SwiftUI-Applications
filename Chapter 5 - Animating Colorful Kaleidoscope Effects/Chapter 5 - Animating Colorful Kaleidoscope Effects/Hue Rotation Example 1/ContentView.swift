//
//  ContentView.swift
//  Hue Rotation Example 1
//
//  Created by Stephen DeStefano on 10/29/20.
//

import SwiftUI

struct ContentView: View {
    @State private var shiftColors = false
    @State private var selectedImage = "ornament"
    let backgroundColor = Color(.black)
    
    var body: some View {
        VStack {
            ZStack {
                backgroundColor
                    //.edgesIgnoringSafeArea(.all)
                    .scaleEffect(1.4)
                
                Image(selectedImage).resizable().padding(20).frame(width: 350, height: 350)
                    .hueRotation(.degrees(shiftColors ? 360: 0))
                    .animation(Animation.easeInOut(duration: 2).delay(0.3).repeatForever(autoreverses: true), value: shiftColors)
                    .onAppear() {
                        shiftColors.toggle()
                }
            }
            ImagePickerView(selectedImage: $selectedImage)
                .frame(width: 350, height: 200)
        }.background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
    }
}
 


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
