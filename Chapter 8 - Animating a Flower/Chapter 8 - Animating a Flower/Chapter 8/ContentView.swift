import SwiftUI

struct ContentView: View {
    @State private var petal = false
    @State private var breatheInLabel = true
    @State private var breatheOutLabel = false
    @State private var offsetBreath = false
    @State private var diffuseBreath = false
    @State private var breatheTheBouquet = false
    
    var body: some View {
        ZStack {
            //MARK: - ADD A WINTER BACKGROUND - AND THE SNOW
            Image("winterNight").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 900)
            SnowView()
            
            //a ZStack so we can offset the entire scene vertically
            ZStack {
                //MARK: - ANIMATE TEXT LABELS SO THEY GROW AND SHRINK
                Group {
                    Text("Breathe In")
                        .font(Font.custom("papyrus", size: 35))
                        .foregroundColor(Color(UIColor.green))
                        .opacity(breatheInLabel ? 0 : 1)
                        .scaleEffect(breatheInLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breatheInLabel)
                    Text("Breathe Out")
                        .font(Font.custom("papyrus", size: 35))
                        .foregroundColor(Color(UIColor.orange))
                        .opacity(breatheOutLabel ? 0 : 1)
                        .scaleEffect(breatheOutLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true),value: breatheOutLabel)
                }
                
                //MARK: - TAKE AN IMAGE AND CONVERT IT TO VAPOR (BREATH) USING THE BLUR MODIFIER
                Group {
                    Image("smoke").resizable().frame(width: 35, height: 125)
                        .offset(y: offsetBreath ? 90 : 0)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true),value: offsetBreath)
                        .blur(radius: diffuseBreath ? 1 : 60)
                        .offset(x: 0, y: diffuseBreath ? -50 : -100)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: diffuseBreath)
                }.shadow(radius: diffuseBreath ? 20 : 0)
                
                //MARK: - ANIMATE FLOWER PETALS IN AN ARC
                Group {
                    PetalView(petal: $petal, degrees: petal ? -25 : -5)
                    ///middle petal does not move
                    Image("petal").resizable().frame(width: 75, height: 125)
                    PetalView(petal: $petal, degrees: petal ? 25 : 5)
                    PetalView(petal: $petal, degrees: petal ? -50 : -10)
                    PetalView(petal: $petal, degrees: petal ? 50 : 10)
                }
                
                //MARK: - ADD A BOUQUET OF FLOWERS AND MAKE THE EXPAND AND CONTRACT SO THEY APPEAR TO BE BREATHING TOO
                Group {
                    Image("bouquet").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(37))
                        .offset(x: -25, y: 90)
                    ///breath the bottom bouquet 1
                        .scaleEffect(breatheTheBouquet ? 1.04 : 1, anchor: .center)
                        .hueRotation(Angle(degrees: breatheTheBouquet ? 50 : 360))
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breatheTheBouquet)

                    Image("bouquet").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(32))
                        .offset(x: -20, y: 95)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    ///breath the bottom bouquet 2
                        .scaleEffect(breatheTheBouquet ? 1.02 : 1, anchor: .center)
                        .hueRotation(Angle(degrees: breatheTheBouquet ? -50 : 300))
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breatheTheBouquet)
                }
            }.offset(y: -80)
            
        }
        .onAppear {
            petal.toggle()
            breatheInLabel.toggle()
            breatheOutLabel.toggle()
            offsetBreath.toggle()
            diffuseBreath.toggle()
            breatheTheBouquet.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



