//
//  HeartView.swift
//  Animating Strokes
//
//  Created by Stephen DeStefano on 10/11/22.
//

import SwiftUI

struct HeartView: View {
    //MARK: - VARIABLES
    @State var strokeReset: Bool = true
    @State var startStroke: CGFloat = 0.0
    @State var endStroke: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Group {
                //SHAPE OUTLINE
                HeartShape()
                    .stroke(style: StrokeStyle(lineWidth: 0.5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.gray)
                //ANIMATING STROKE
                HeartShape()
                    .trim(from: startStroke, to: endStroke)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.white)
                ///HEART BITMAP IMAGE
                Image("heart").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 246, alignment: .center)
                    .position(x: 125, y:117.5)
            }
        }.offset (x: 75, y: -30)
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.23, repeats: true) { timer in
                ///if (swiftUIEndStroke >= 1) { ORIGINAL
                ///use this value to set a delay before the animation starts again, a larger number increases the delay
                if (endStroke >= 1) {
                    if (strokeReset) {
                        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { _ in
                            endStroke = 0
                            startStroke = 0
                            strokeReset.toggle()
                        }
                        strokeReset = false
                    }
                }
                withAnimation(Animation.easeOut) {
                    endStroke += 0.12
                    startStroke = endStroke - 0.4 //0.3 is the original
                }
            }
        }
    }
}

struct HeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
                path.move(to: CGPoint(x: 123.317299, y: 231.807556))
                path.addCurve(to: CGPoint(x: 110.726212, y: 210.572662), control1: CGPoint(x: 121.229286, y: 226.485565), control2: CGPoint(x: 115.802895, y: 217.333939))
                path.addCurve(to: CGPoint(x: 64.628258, y: 163.623611), control1: CGPoint(x: 101.03334, y: 197.663406), control2: CGPoint(x: 91.529846, y: 187.984451))
                path.addCurve(to: CGPoint(x: 20.02182, y: 119.234268), control1: CGPoint(x: 38.671074, y: 140.117981), control2: CGPoint(x: 29.334246, y: 130.826599))
                path.addCurve(to: CGPoint(x: 3.08682, y: 89.673164), control1: CGPoint(x: 12.762635, y: 110.197868), control2: CGPoint(x: 5.773027, y: 97.99707))
                path.addCurve(to: CGPoint(x: 0.00042, y: 69.130699), control1: CGPoint(x: 0.116871, y: 80.470001), control2: CGPoint(x: 0.010291, y: 79.760521))
                path.addCurve(to: CGPoint(x: 1.39829, y: 53.71632), control1: CGPoint(x: -0.007431, y: 59.749462), control2: CGPoint(x: 0.081764, y: 58.765789))
                path.addCurve(to: CGPoint(x: 19.214291, y: 20.760088), control1: CGPoint(x: 4.960969, y: 40.051876), control2: CGPoint(x: 10.984049, y: 28.910318))
                path.addCurve(to: CGPoint(x: 56.859573, y: 0.919734), control1: CGPoint(x: 28.905043, y: 11.163548), control2: CGPoint(x: 42.293953, y: 4.107133))
                path.addCurve(to: CGPoint(x: 71.38961, y: 0.000374), control1: CGPoint(x: 60.255306, y: 0.176645), control2: CGPoint(x: 63.199898, y: -0.009587))
                path.addCurve(to: CGPoint(x: 93.936211, y: 3.778685), control1: CGPoint(x: 82.592796, y: 0.014956), control2: CGPoint(x: 85.417847, y: 0.48832))
                path.addCurve(to: CGPoint(x: 122.411758, y: 27.637375), control1: CGPoint(x: 104.694221, y: 7.934151), control2: CGPoint(x: 115.48877, y: 16.978535))
                path.addCurve(to: CGPoint(x: 125.00042, y: 31.237259), control1: CGPoint(x: 123.697739, y: 29.617311), control2: CGPoint(x: 124.86264, y: 31.237259))
                path.addCurve(to: CGPoint(x: 127.589088, y: 27.637375), control1: CGPoint(x: 125.138206, y: 31.237259), control2: CGPoint(x: 126.303108, y: 29.617311))
                path.addCurve(to: CGPoint(x: 156.064636, y: 3.778685), control1: CGPoint(x: 134.51207, y: 16.978535), control2: CGPoint(x: 145.306625, y: 7.934151))
                path.addCurve(to: CGPoint(x: 178.611237, y: 0.000374), control1: CGPoint(x: 164.582993, y: 0.48832), control2: CGPoint(x: 167.408051, y: 0.014954))
                path.addCurve(to: CGPoint(x: 193.141281, y: 0.919734), control1: CGPoint(x: 186.800949, y: -0.009585), control2: CGPoint(x: 189.745544, y: 0.176645))
                path.addCurve(to: CGPoint(x: 230.786545, y: 20.760088), control1: CGPoint(x: 207.706879, y: 4.107133), control2: CGPoint(x: 221.09581, y: 11.163548))
                path.addCurve(to: CGPoint(x: 248.60257, y: 53.71632), control1: CGPoint(x: 239.0168, y: 28.910318), control2: CGPoint(x: 245.039856, y: 40.051876))
                path.addCurve(to: CGPoint(x: 250.000427, y: 69.130699), control1: CGPoint(x: 249.919083, y: 58.765789), control2: CGPoint(x: 250.00827, y: 59.749462))
                path.addCurve(to: CGPoint(x: 246.914017, y: 89.673164), control1: CGPoint(x: 249.990433, y: 79.760521), control2: CGPoint(x: 249.883957, y: 80.470001))
                path.addCurve(to: CGPoint(x: 229.979019, y: 119.234268), control1: CGPoint(x: 244.227829, y: 97.99707), control2: CGPoint(x: 237.23822, y: 110.197868))
                path.addCurve(to: CGPoint(x: 185.372589, y: 163.623611), control1: CGPoint(x: 220.666565, y: 130.826599), control2: CGPoint(x: 211.329773, y: 140.117981))
                path.addCurve(to: CGPoint(x: 139.274628, y: 210.572662), control1: CGPoint(x: 158.470993, y: 187.984451), control2: CGPoint(x: 148.967514, y: 197.663406))
                path.addCurve(to: CGPoint(x: 126.683548, y: 231.807556), control1: CGPoint(x: 134.197952, y: 217.333939), control2: CGPoint(x: 128.771561, y: 226.485565))
                path.addCurve(to: CGPoint(x: 125.00042, y: 235.224014), control1: CGPoint(x: 125.946327, y: 233.686615), control2: CGPoint(x: 125.188927, y: 235.224014))
                path.addCurve(to: CGPoint(x: 123.317299, y: 231.807556), control1: CGPoint(x: 124.81192, y: 235.224014), control2: CGPoint(x: 124.05452, y: 233.686615))
                path.closeSubpath()
                path.move(to: CGPoint(x: 123.317299, y: 231.807556))
        return path
    }
 }





struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView()
    }
}
