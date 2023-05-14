
import SwiftUI

struct ContentView: View {
    @ObservedObject var appData: DataModel
    let backgroundColor = Color(UIColor.black)
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            //MARK: - ADD THE PEOPLEANDELEVATOR VIEW
            ElevatorAndPeopleView(doorsOpened: $appData.doorsOpened)
            
            //MARK: - ELEVATOR BUTTON
            GeometryReader { geo in
                Button(action: {
                    appData.stopTimer()
                    appData.playDoorOpenCloseSound(interval: 0.5)
                    appData.doorsOpened.toggle()
                    appData.goingUp.toggle()
                    appData.floorNumbers()
                }) {
                    ///if the doors are opened, make the button white, otherwise make it black
                    Circle().frame(width: 10, height: 10)
                        .foregroundColor(appData.doorsOpened ? .white : .black)
                        .overlay(Circle().stroke(Color.red, lineWidth: 1))
                        .padding(5)
                        .background(Color.black)
                        .cornerRadius(30)
                    //.padding(8)
                }.position(x: (geo.size.width / 33), y: (geo.size.height / 2))
                
                //MARK: - ADD THE FLOOR NUMBER LIGHTS
                HStack {
                    Image(systemName: "1.circle")
                        .foregroundColor(appData.floor1 ? .red : .black)
                        .opacity(appData.floor1 ? 1 : 0.3)
                    Image(systemName: "2.circle")
                        .foregroundColor(appData.floor2 ? .red : .black)
                        .opacity(appData.floor2 ? 1 : 0.3)
                }.position(x: (geo.size.width / 2), y: (geo.size.height * 0.02) + 2)
                    .font(.system(size: 25))
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appData: DataModel())
    }
}
