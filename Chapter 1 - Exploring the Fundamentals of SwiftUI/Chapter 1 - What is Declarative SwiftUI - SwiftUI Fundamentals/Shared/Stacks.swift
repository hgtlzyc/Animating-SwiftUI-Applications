//  Stacks.swift
//  Chapter_1
//  Created by Stephen DeStefano

import SwiftUI
///an example of using a VStack
struct Stacks: View {
    @State var myText = ""
    @State var changeText = false
    
    var body: some View {
        VStack {
            Text(myText)
                .padding()
            Button("Button") {
                changeText.toggle()
                if changeText {
                    myText = "Hello SwiftUI!"
                } else {
                    myText = "This is a VStack"
                }
            }
        }
    }
}

///Aligning the child views inside the VStack to the leading edge
///to see the other options available, type out a dot in the alignment parameter
struct VStack_Alignment: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hi, I'm child one in this vertical stack")
            Text("Hi, I'm child two in this vertical stack")
            Text("Hi, I'm child three in this vertical stack")
            Text("Hi, I'm child four in this vertical stack, I'm the best")
        }
    }
}

///An example of using the spacing parameter for the VStack
struct VStack_Spacing: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Hi, I'm child one in this vertical stack")
            Text("Hi, I'm child two in this vertical stack")
            Text("Hi, I'm child three in this vertical stack")
            Text("Hi, I'm child four in this vertical stack, I'm the best")
        }
    }
}

///An example of using an HStack
struct HStacks: View {
    var body: some View {
        HStack() {
            Text("0")
            Text("1")
            Text("2")
            Text("3")
            Text("4")
            Text("5")
            Text("6")
            Text("7")
            Text("8")
            Text("9")
        }.font(.headline)
    }
}

///Modifying the child view inside the stack
struct Modify_The_Child: View {
    var body: some View {
        HStack() {
            Text("0")
            Text("1")
            Text("2")
            Text("3")
            Text("4").font(.title)
            Text("5")
            Text("6")
            Text("7")
            Text("8")
            Text("9")
        }.font(.headline)
    }
}

///An example of using a ZStack
struct ZStacks: View {
    var body: some View {
        ZStack() {
            Image(systemName: "rectangle.inset.filled.and.person.filled")
                .renderingMode(.original)
                .resizable()
                .frame(width: 350, height: 250)
             
            Text("SwiftUI")
                .font(.system(size: 50))
                .foregroundColor(.yellow)
                .padding(.trailing, 80)
        }
    }
}

///Combining the VStack, HStack, and ZStack inside one struct
struct Combining_Stacks: View {
    var body: some View {
        VStack {
            ZStack() {
                Image(systemName: "cloud.moon.rain.fill")
                    .foregroundColor(Color(.systemOrange))
                    .font(.system (size: 150))
                Text("Stormy").bold()
                    .font(.system(size: 30))
                    .offset(x: -15, y: -5)
                    .foregroundColor(.indigo)
            }
            HStack() {
                Image(systemName: "tornado")
                    .foregroundColor(Color(.systemBlue))
                    .font(.system (size: 50))
                 
                VStack(alignment: .leading) {
                    Text("Be prepared for anything")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                     
                    Text("With the Stormy Weather app")
                        .font(.system(size: 16))
                }
            }
        }
    }
}














struct Stacks_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            Stacks()
            VStack_Alignment()
            VStack_Spacing()
            HStacks()
            Modify_The_Child()
            ZStacks()
            Combining_Stacks()
        }
    }
}
