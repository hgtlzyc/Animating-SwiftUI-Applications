//  Divider_View.swift
//  Chapter_1
//  Created by Stephen DeStefano

import SwiftUI

///Using the Divider view
struct Divider_View: View {
    var body: some View {
              VStack(alignment: .leading, spacing: 10) {
                  Text("Hi, I'm child one in this vertical stack")
                  Text("Hi, I'm child two in this vertical stack")
                  Text("Hi, I'm child three in this vertical stack")
                  Text("Hi, I'm child four in this vertical stack")
                  
                  Divider().background(Color.black)
                   
                  Text("Hi, I'm child five in this vertical stack")
                  Text("Hi, I'm child six in this vertical stack")
                  Text("Hi, I'm child seven in this vertical stack")
                  Text("Hi, I'm child eight in this vertical stack")
              }.padding()
          }
      }

///Using the divider vertically
struct Divider_Vertical: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Hi, I'm child one in this vertical stack")
            Text("Hi, I'm child two in this vertical stack")
            Text("Hi, I'm child three in this vertical stack")
            Text("Hi, I'm child four in this vertical stack")
             
            Divider().frame(height: 200).frame(width: 3).background(Color.blue)
            Divider().frame(height:200).frame(width: 3).background(Color.blue).offset(x: 300, y: 0)
             
            Text("Hi, I'm child five in this vertical stack")
            Text("Hi, I'm child six in this vertical stack")
            Text("Hi, I'm child seven in this vertical stack")
            Text("Hi, I'm child eight in this vertical stack")
        }.padding()
    }
}

///Changing the thickness of the divider
struct Divider_Thickness: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Hi, I'm child one in this vertical stack")
            Text("Hi, I'm child two in this vertical stack")
            Text("Hi, I'm child three in this vertical stack")
            Text("Hi, I'm child four in this vertical stack")
            Divider().frame(height: 20).frame(width: 300).background(Color.blue)
             
            Text("Hi, I'm child five in this vertical stack")
            Text("Hi, I'm child six in this vertical stack")
            Text("Hi, I'm child seven in this vertical stack")
            Text("Hi, I'm child eight in this vertical stack")
        }.padding()
    }
}

struct Divider_View_Previews: PreviewProvider {
    static var previews: some View {
        Divider_View()
        Divider_Vertical()
        Divider_Thickness()
    }
}
