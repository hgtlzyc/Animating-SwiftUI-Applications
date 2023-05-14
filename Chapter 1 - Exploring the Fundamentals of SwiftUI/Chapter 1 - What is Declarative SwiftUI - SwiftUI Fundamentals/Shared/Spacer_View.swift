//  Spacer_View.swift
//  Chapter_1
//  Created by Stephen DeStefano

import SwiftUI

///Using the Spacer view
struct Spacer_View: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                Text("Hi, I'm child one in this vertical stack")
                Text("Hi, I'm child two in this vertical stack")
                Text("Hi, I'm child three in this vertical stack")
                Text("Hi, i'mI'm child four in this vertical stack")
                 
                Spacer()
                 
                Text("Hi, I'm child five in this vertical stack")
                Text("Hi, I'm child six in this vertical stack")
                Text("Hi, I'm child seven in this vertical stack")
                Text("Hi, I'm child eight in this vertical stack")
              }
            }
        }

struct Spacer_View_Previews: PreviewProvider {
    static var previews: some View {
        Spacer_View()
    }
}
