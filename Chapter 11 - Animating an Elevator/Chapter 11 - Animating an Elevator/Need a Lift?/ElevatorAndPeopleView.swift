

import SwiftUI

struct ElevatorAndPeopleView: View {
    @Binding var doorsOpened: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                //MARK: - INSIDE ELEVATOR SCENE
                Image("inside").resizable()
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
                
                //MARK: - ADD THE PEOPLE
                Image("manOne")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth: geo.size.width - 200, maxHeight: geo.size.height - 300)
                    .shadow(color: .black, radius: 30, x: 5, y: 5)
                    .offset(x: 0, y: 250)
                
                Image("manTwo")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height - 290)
                    .shadow(color: .black, radius: 30, x: 5, y: 5)
                    .offset(x: 40, y: 230)
                    .rotation3DEffect(Angle(degrees: 20), axis: (x: 0, y: -1, z: 0))
                
                Image("manThree")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth: geo.size.width - 100, maxHeight: geo.size.height - 250)
                    .shadow(color: .black, radius: 30, x: 5, y: 5)
                    .offset(x: 130, y: 255)
                
                Image("manFour")
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(maxWidth: geo.size.width - 0, maxHeight: geo.size.height - 280)
                    .shadow(color: .black, radius: 30, x: 5, y: 5)
                    .offset(x: -80, y: 265)
                
                //MARK: - ADD THE DOORS
                HStack {
                    Image("leftDoor").resizable()
                        .frame(maxWidth: geo.size.width)
                        .offset(x: doorsOpened ? -geo.size.width / 2 : 4)
                    
                    Image("rightDoor").resizable()
                        .frame(maxWidth: geo.size.width)
                        .offset(x: doorsOpened ? geo.size.width / 2 : -4)
                }
                Image("doorFrame").resizable()
                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
                
            }.animation(Animation.easeInOut.speed(0.09).delay(0.3), value: doorsOpened)
        }
    }
}

struct ElevatorAndPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ElevatorAndPeopleView(doorsOpened: .constant(false))
    }
}






//
//                    Image("manTwoMouth")
//                        .resizable().aspectRatio(contentMode: .fit)
//                        .frame(width: 105, height: 105)
//                        .offset(x: 190, y: 234)
//                        .rotation3DEffect(
//                        .degrees(moveMouth ? 0.2 : 0), axis: (x: moveMouth ? 1 : -4, y: moveMouth ? 0 : 0, z: 1))
//                        .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: moveMouth)

