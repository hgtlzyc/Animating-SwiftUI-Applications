//
//  GeometryReader_View.swift
//  Chapter_1
//
//  Created by Stephen DeStefano on 4/1/22.
//

import SwiftUI

///Empty Geometry Reader
struct GeometryReader_View: View {
    var body: some View {
        GeometryReader {_ in
            //empty geometry reader
        }.background(Color.yellow)
    }
}

///The default alignment for the Geometry Reader is the upper left corner - There are three tornado images here, but they are aligned on top of each other
struct GeometryReader_Default_Alignment: View {
    var body: some View {
        GeometryReader {_ in
            Image(systemName: "tornado")
            Image(systemName: "tornado")
            Image(systemName: "tornado")
        }.background(Color.yellow)
            .font(.largeTitle)
    }
}

///GeometryReader Size Property - In portrait mode, the image is a bigger size, but when the device is rotated to landscape, the image scales down to adapt to the screen change
struct GeometryReader_With_Image: View {
    var body: some View {
        GeometryReader {geometryProxy in
            Image("swiftui_img")
                .resizable()
                .scaledToFit()
                .frame(width: geometryProxy.size.width / 2, height: geometryProxy.size.height / 4)
                .background(Color.gray)
        }
    }
}

///Position views using the Geometry Reader
struct GeometryReader_Positioning_Views: View {
   var body: some View {
 
GeometryReader { geometryProxy in
           //top right position
           VStack {
               Image(systemName: "tornado")
               .imageScale(.large)
           Text("Top Right")
               .font(.title)
           }.position(x: geometryProxy.size.width - 80, y: geometryProxy.size.height / 40)
 
           //bottom left position
           VStack {
               Image(systemName: "tornado")
               .imageScale(.large)
                
           Text("Bottom Left")
               .font(.title)
           }.position(x: geometryProxy.size.width - 300,y: geometryProxy.size.height - 40)
       }.background(Color.accentColor)
       .foregroundColor(.white)
   }
}

///Reading the position of the geometry reader - Running the code will display the x and y coordinate values for both the global and local space, for when the device is in portrait mode - Rotating the device into landscape mode changes the global values to reflect the new location of the image and text views.
struct  GeometryReader_Reading_the_position: View {
    var body: some View {
        GeometryReader { geometryProxy in
            VStack {
                Image("swiftui_img")
                    .resizable()
                    .scaledToFit()
                Text("Global").font(.title)
                Text("X, Y \(geometryProxy.frame(in: CoordinateSpace.global).origin.x, specifier: "(%.f,") \(geometryProxy.frame(in: .global).origin.y, specifier: "%.f)")")
                Text("Local").font(.title)
                Text("X, Y  \(geometryProxy.frame(in: .local).origin.x, specifier: "(%.f") \(geometryProxy.frame(in: .local).origin.y, specifier: "%.f)")")
            }
        }.frame(height: 250)
    }
}

///Using the min, mid, and max properties - When the device is rotated, those values will re-adjust to new values that reflect the change in the screens orientation
struct Using_Min_mid_Max: View {
    var body: some View {
        GeometryReader { geometryProxy in
            VStack() {
                Spacer()
                Text("Local Values").font(.title2).bold()
                HStack() {
                    Text("minX: \(Int(geometryProxy.frame(in: .local).minX))")
                    Spacer()
                    Text("midX: \(Int(geometryProxy.frame(in: .local).midX))")
                    Spacer()
                    Text("maxX: \(Int(geometryProxy.frame(in: .local).maxX))")
                }
                 
                Divider().background(Color.black)
                 
                Text("Global Values").font(.title2).bold()
                HStack() {
                    Text("minX: \(Int(geometryProxy.frame(in: .global).minX))")
                    Spacer()
                    Text("midX: \(Int(geometryProxy.frame(in: .global).midX))")
                    Spacer()
                    Text("maxX: \(Int(geometryProxy.frame(in: .global).maxX))")
                }
                Spacer()
                 
            }.padding(.horizontal)
        }
    }
}




struct GeometryReader_View_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader_View()
        GeometryReader_Default_Alignment()
        GeometryReader_With_Image()
        GeometryReader_Positioning_Views()
        GeometryReader_Reading_the_position()
        Using_Min_mid_Max()
    }
}
