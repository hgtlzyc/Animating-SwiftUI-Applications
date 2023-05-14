//
//  Scale_Example_Three.swift
//  Chapter2
//
//  Created by Stephen DeStefano on 4/26/22.
//

import SwiftUI

struct Scale_Example_Three: View {
    @State private var scaleFromAnchor = true
    var body: some View {
                VStack{
            Text("SCALE FROM ANCHOR ").font(.title).bold()
            Image(systemName: "heart.fill")
                .renderingMode(.original) //allows multicolor for SF Symbols
                .resizable()
                .frame(width: 150, height: 125, alignment: .center)
                .scaleEffect(scaleFromAnchor ? 1 : 0.2, anchor: .bottomTrailing)
                .animation(.default, value: scaleFromAnchor)
                .padding(10)
            Button("Scale from Anchor") {
                scaleFromAnchor.toggle()
            }
        }.font(.title2)
    }
}

struct Scale_Example_Three_Previews: PreviewProvider {
    static var previews: some View {
        Scale_Example_Three()
    }
}
