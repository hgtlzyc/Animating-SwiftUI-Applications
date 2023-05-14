//
//  ContentView.swift
//  Shared
//
//  Created by Stephen DeStefano on 4/26/22.
//

import SwiftUI

struct Scale_Example_One: View {
    @State private var scaleCircle = false

    var body: some View {
        VStack () {
            //MARK: - ANIMATE THE SCALE OF A CIRCLE SHAPE
            VStack {
                Text("SCALE SHAPE").font(.title).bold()
                Circle()
                    .frame(width: 150)
                    .foregroundColor(.green)
                    .scaleEffect(scaleCircle ? 0.1 : 1)
                    .animation(.default, value: scaleCircle)
                Button("Scale Shape") {
                    scaleCircle.toggle()
                }
            }.font(.title2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Scale_Example_One()
    }
}
