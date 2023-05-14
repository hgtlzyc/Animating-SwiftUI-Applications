//
//  BeltView.swift
//  Gears and Belts
//
//  Created by Stephen DeStefano on 11/10/20.
//

import SwiftUI

struct BeltView: View {
    @State var animateBelt: Bool = false
    //bet vars
    var beltWidth: CGFloat = 0.0
    var beltHeight: CGFloat = 0.0
    var offsetBeltX: CGFloat = 0.0
    var offsetBeltY: CGFloat = 0.0
    @State var dashPhaseValue: CGFloat = 45
    var rotateDegrees: Double = 0.0
    
    var xAxis: CGFloat = 0.0
    var yAxis: CGFloat = 0.0
    var zAxis: CGFloat = 0.0
    
    var body: some View {
        
        ZStack {
            //belt
            Capsule()
                .stroke(Color.black, style: StrokeStyle(lineWidth: 7, lineJoin: .round, dash: [5, 1.4], dashPhase: animateBelt ? dashPhaseValue : 0))
                .frame(width: beltWidth, height: beltHeight)
                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false).speed(3), value: animateBelt)
                .onAppear {
                    animateBelt.toggle()
                }
        } .shadow(color: .black, radius: 10, x: 1, y: 0)
            .rotationEffect(.degrees(rotateDegrees), anchor: .center)
            .offset(x: offsetBeltX, y: offsetBeltY)
    }
}

struct BeltView_Previews: PreviewProvider {
    static var previews: some View {
        BeltView(animateBelt: true, beltWidth: 380, beltHeight: 48, offsetBeltX: 0, offsetBeltY: 0, rotateDegrees: 90)
            .previewLayout(.fixed(width: 100, height: 400))
    }
}

///TO MAKE THE BELT ANIMATE SEAMLESSLY PLAY AROUND WITH THE DASHPHASE VALUE, I SET IT TO 45 AND THAT SEEMS TO MAKE THE BELT TURN SEAMLESSLY, BUT IF YOUR BELTS ARE TURNING AND BRIEFLY STOPPING, THEN ALTER THAT DASHPHASE VALUE EITHER UP OR DOWN FROM THE INITIAL 45 VALUE

///CODE TO MAKE THE BELT ANIMATE SEAMLESSLY USING A TIMER
///         the onAppear method is used to start a Timer when the view appears. The timer is set to fire every 0.03 seconds, and on each iteration, the dashPhase value is decremented by 1. This creates the appearance of the belt moving to the left. When the dashPhase value reaches -20, it is reset to 40 to make the animation loop seamlessly.
//ZStack {
//    Capsule()
//        .stroke(Color.black, style: StrokeStyle(lineWidth: 7, lineJoin: .round, dash: [5, 1.4], dashPhase: dashPhaseValue))
//        .frame(width: beltWidth, height: beltHeight)
//}.onAppear {
//    Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
//        dashPhaseValue -= 1
//        if dashPhaseValue <= -20 {
//            dashPhaseValue = 5000
//        }
//    }
//}.shadow(color: .black, radius: 10, x: 1, y: 0)
// .rotationEffect(.degrees(rotateDegrees), anchor: .center)
// .offset(x: offsetBeltX, y: offsetBeltY)
