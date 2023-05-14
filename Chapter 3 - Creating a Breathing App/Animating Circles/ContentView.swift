
import SwiftUI


struct ContentView: View {
    //animation bools
    @State var scaleUpDown = false
    @State var rotateInOut = false
    @State var moveInOut = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            
            //MARK: - ZStack for the 12 o’clock and 6 o’clock circles
            ZStack{
                ZStack {
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)

                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                }.opacity(0.5)
                
                //MARK: - ZStack for the 2 and 7 o'clock circles
                ZStack {
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)

                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                }.opacity(0.5)
                    .rotationEffect(.degrees(60))
                
                //MARK: - ZStack for the 10 and 4 o'clock circles
                ZStack {
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                    Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                }.opacity(0.5)
                    .rotationEffect(.degrees(120))
                
            }
            //MARK: - Animations
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleUpDown ? 1 : 1/4)
            .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8), value: scaleUpDown)
            .onAppear() {
                rotateInOut.toggle()
                scaleUpDown.toggle()
                moveInOut.toggle()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



















//
