//  Padding_Modifier.swift
//  Chapter_1
//  Created by Stephen DeStefano

import SwiftUI

///Using the padding modifier
struct Padding_Modifier: View {
        var body: some View {
            VStack{
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hi, I'm child one in this vertical stack")
                    Text("Hi, I'm child two in this vertical stack")
                    Text("Hi, I'm child three in this vertical stack")
                    Text("Hi, I'm child four in this vertical stack")
                    Text("Hi, I'm child five in this vertical stack")
                    Text("Hi, I'm child six in this vertical stack")
                    Text("Hi, I'm child seven in this vertical stack")
                    Text("Hi, I'm child eight in this vertical stack")
                }.background(Color.yellow)
                    .padding(30)
                    .background(Color.red)
            }
        }
    }

///Padding the leading side - type in a dot in the alignment parameter to see more padding options
struct Padding_Leading: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 10) {
                Text("Hi, I'm child one in this vertical stack")
                Text("Hi, I'm child two in this vertical stack")
                Text("Hi, I'm child three in this vertical stack")
                Text("Hi, I'm child four in this vertical stack")
                Text("Hi, I'm child five in this vertical stack")
                Text("Hi, I'm child six in this vertical stack")
                Text("Hi, I'm child seven in this vertical stack")
                Text("Hi, I'm child eight in this vertical stack")
            }.padding(.leading, 75)
        }
    }
}

///Padding individual child views
struct Padding_Children: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 10) {
                Text("Hi, I'm child one in this vertical stack").padding(.leading, 75)
                Text("Hi, I'm child two in this vertical stack").padding(.bottom, 75)
                Text("Hi, I'm child three in this vertical stack").padding(.top, 75)
                Text("Hi, I'm child four in this vertical stack").padding(.trailing, 75)
                Text("Hi, I'm child five in this vertical stack").padding(.leading, 75)
                Text("Hi, I'm child six in this vertical stack").padding(.horizontal, 75)
                Text("Hi, I'm child seven in this vertical stack").padding(.all, 75)
                Text("Hi, I'm child eight in this vertical stack").padding(.trailing, 75)
            }
        }
    }
}

struct Padding_Modifier_Previews: PreviewProvider {
    static var previews: some View {
        Padding_Modifier()
        Padding_Leading()
        Padding_Children()
    }
}
