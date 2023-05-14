//
//  Scale_Example_Two.swift
//  Chapter2
//
//  Created by Stephen DeStefano on 4/26/22.
//

import SwiftUI

struct Scale_Example_Two: View {
    @State private var scaleBug = false
    
    var body: some View {
        //MARK: - ANIMATE THE SCALE OF A SYSTEM IMAGE
        VStack{
            Text("SCALE IMAGE").font(.title).bold()
            Image(systemName: "ladybug.fill")
                .renderingMode(.original) //allows multicolor for SF Symbols
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .scaleEffect(scaleBug ? 0.1 : 1)
                .animation(.default, value: scaleBug)
                .padding(10)
            Button("Scale Image") {
                scaleBug.toggle()
            }
        }.font(.title2)
    }
}

struct Scale_Example_Two_Previews: PreviewProvider {
    static var previews: some View {
        Scale_Example_Two()
    }
}
