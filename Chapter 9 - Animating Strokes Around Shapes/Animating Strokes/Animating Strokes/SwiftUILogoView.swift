//
//  SwiftUILogoView.swift
//  Animating Strokes
//
//  Created by Stephen DeStefano on 10/11/22.
//

import SwiftUI

struct SwiftUILogoView: View {
    //MARK: - VARIABLES
    @State var strokeReset: Bool = true
    @State var startStroke: CGFloat = 0.0
    @State var endStroke: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Group {
                //SHAPE OUTLINE
                SwiftUILogoShape()
                    .stroke(style: StrokeStyle(lineWidth: 0.5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.gray)
                //ANIMATING STROKE
                SwiftUILogoShape()
                    .trim(from: startStroke, to: endStroke)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
            }.offset(x: 75)
        }.onAppear() {
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

struct SwiftUILogoShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
    
        path.move(to: CGPoint(x: 201.374207, y: 235.109955))
        path.addCurve(to: CGPoint(x: 231.023102, y: 220.544876), control1: CGPoint(x: 212.656006, y: 233.244553), control2: CGPoint(x: 222.89035, y: 228.216904))
        path.addCurve(to: CGPoint(x: 246.658112, y: 187.955658), control1: CGPoint(x: 240.323807, y: 211.771057), control2: CGPoint(x: 244.618469, y: 202.819397))
        path.addCurve(to: CGPoint(x: 247.548935, y: 118.12896), control1: CGPoint(x: 247.435989, y: 182.286972), control2: CGPoint(x: 247.537949, y: 174.291122))
        path.addCurve(to: CGPoint(x: 246.924286, y: 50.475689), control1: CGPoint(x: 247.557465, y: 71.323341), control2: CGPoint(x: 247.393875, y: 53.596062))
        path.addCurve(to: CGPoint(x: 238.150009, y: 25.69224), control1: CGPoint(x: 245.348648, y: 40.005653), control2: CGPoint(x: 242.683746, y: 32.478474))
        path.addCurve(to: CGPoint(x: 206.923889, y: 3.865045), control1: CGPoint(x: 230.992371, y: 14.978473), control2: CGPoint(x: 220.566803, y: 7.690959))
        path.addLine(to: CGPoint(x: 201.638474, y: 2.38056))
        path.addLine(to: CGPoint(x: 123.414375, y: 2.38056))
        path.addCurve(to: CGPoint(x: 41.490486, y: 3.367171), control1: CGPoint(x: 48.659203, y: 2.38056), control2: CGPoint(x: 45.026207, y: 2.422269))
        path.addCurve(to: CGPoint(x: 13.810988, y: 20.727581), control1: CGPoint(x: 31.00761, y: 6.168672), control2: CGPoint(x: 20.186533, y: 12.955585))
        path.addCurve(to: CGPoint(x: 4.47186, y: 39.376305), control1: CGPoint(x: 10.362469, y: 24.931444), control2: CGPoint(x: 6.209752, y: 33.22374))
        path.addCurve(to: CGPoint(x: 2.238943, y: 125.528526), control1: CGPoint(x: 2.243874, y: 47.263931), control2: CGPoint(x: 2.035074, y: 55.32003))
        path.addLine(to: CGPoint(x: 2.426184, y: 190.010559))
        path.addLine(to: CGPoint(x: 3.881305, y: 195.295959))
        path.addCurve(to: CGPoint(x: 17.174213, y: 219.279083), control1: CGPoint(x: 6.800122, y: 205.897903), control2: CGPoint(x: 10.135222, y: 211.9151))
        path.addCurve(to: CGPoint(x: 37.329285, y: 232.193024), control1: CGPoint(x: 23.177231, y: 225.559265), control2: CGPoint(x: 28.688261, y: 229.090347))
        path.addCurve(to: CGPoint(x: 65.274841, y: 235.688644), control1: CGPoint(x: 44.836651, y: 234.888641), control2: CGPoint(x: 48.343048, y: 235.32724))
        path.addCurve(to: CGPoint(x: 201.374207, y: 235.10994), control1: CGPoint(x: 90.438141, y: 236.225739), control2: CGPoint(x: 197.375977, y: 235.771042))
        path.addLine(to: CGPoint(x: 201.374207, y: 235.109955))
        path.closeSubpath()
        path.move(to: CGPoint(x: 207.854324, y: 191.140839))
        path.addCurve(to: CGPoint(x: 189.55101, y: 178.680161), control1: CGPoint(x: 203.870682, y: 184.480637), control2: CGPoint(x: 196.820801, y: 179.681152))
        path.addCurve(to: CGPoint(x: 163.778793, y: 183.967041), control1: CGPoint(x: 182.443893, y: 177.701569), control2: CGPoint(x: 171.964661, y: 179.851257))
        path.addCurve(to: CGPoint(x: 104.310326, y: 190.023361), control1: CGPoint(x: 147.121033, y: 192.342392), control2: CGPoint(x: 125.65239, y: 194.528778))
        path.addCurve(to: CGPoint(x: 62.367867, y: 172.44873), control1: CGPoint(x: 90.846733, y: 187.181122), control2: CGPoint(x: 74.134834, y: 180.178543))
        path.addCurve(to: CGPoint(x: 28.270744, y: 139.889572), control1: CGPoint(x: 49.344082, y: 163.893295), control2: CGPoint(x: 38.209942, y: 153.261368))
        path.addLine(to: CGPoint(x: 26.7665, y: 137.865829))
        path.addLine(to: CGPoint(x: 31.750057, y: 141.099091))
        path.addCurve(to: CGPoint(x: 75.945862, y: 158.107086), control1: CGPoint(x: 44.331642, y: 149.261856), control2: CGPoint(x: 59.951839, y: 155.27301))
        path.addCurve(to: CGPoint(x: 107.731239, y: 158.113541), control1: CGPoint(x: 85.50679, y: 159.801254), control2: CGPoint(x: 99.186081, y: 159.804031))
        path.addCurve(to: CGPoint(x: 127.802101, y: 151.478394), control1: CGPoint(x: 115.147087, y: 156.646469), control2: CGPoint(x: 122.068047, y: 154.358505))
        path.addLine(to: CGPoint(x: 132.189835, y: 149.274521))
        path.addLine(to: CGPoint(x: 125.687943, y: 144.210205))
        path.addCurve(to: CGPoint(x: 95.729385, y: 117.610237), control1: CGPoint(x: 115.189911, y: 136.033325), control2: CGPoint(x: 107.748283, y: 129.425949))
        path.addCurve(to: CGPoint(x: 59.793221, y: 78.553398), control1: CGPoint(x: 82.979904, y: 105.076286), control2: CGPoint(x: 73.370979, y: 94.632935))
        path.addCurve(to: CGPoint(x: 45.634911, y: 60.782242), control1: CGPoint(x: 48.669926, y: 65.380577), control2: CGPoint(x: 45.00642, y: 60.782242))
        path.addCurve(to: CGPoint(x: 49.767094, y: 64.031288), control1: CGPoint(x: 45.773701, y: 60.782242), control2: CGPoint(x: 47.633183, y: 62.244308))
        path.addCurve(to: CGPoint(x: 80.338264, y: 87.562439), control1: CGPoint(x: 55.798801, y: 69.082336), control2: CGPoint(x: 70.72448, y: 80.570885))
        path.addCurve(to: CGPoint(x: 118.977669, y: 113.107819), control1: CGPoint(x: 95.979797, y: 98.937614), control2: CGPoint(x: 117.413338, y: 113.107819))
        path.addCurve(to: CGPoint(x: 113.50721, y: 106.815742), control1: CGPoint(x: 119.305389, y: 113.107819), control2: CGPoint(x: 116.843681, y: 110.276382))
        path.addCurve(to: CGPoint(x: 75.693642, y: 62.103596), control1: CGPoint(x: 101.648506, y: 94.515709), control2: CGPoint(x: 87.992622, y: 78.368484))
        path.addCurve(to: CGPoint(x: 74.530655, y: 57.862049), control1: CGPoint(x: 68.159889, y: 52.140514), control2: CGPoint(x: 68.072792, y: 51.822853))
        path.addCurve(to: CGPoint(x: 117.422249, y: 93.577194), control1: CGPoint(x: 86.874908, y: 69.406021), control2: CGPoint(x: 102.377426, y: 82.31472))
        path.addCurve(to: CGPoint(x: 156.865982, y: 119.978859), control1: CGPoint(x: 131.250885, y: 103.929245), control2: CGPoint(x: 155.22879, y: 119.978859))
        path.addCurve(to: CGPoint(x: 161.043488, y: 107.227669), control1: CGPoint(x: 157.566208, y: 119.978859), control2: CGPoint(x: 159.695496, y: 113.479568))
        path.addCurve(to: CGPoint(x: 160.740021, y: 78.75264), control1: CGPoint(x: 162.478745, y: 100.571075), control2: CGPoint(x: 162.325867, y: 86.225777))
        path.addCurve(to: CGPoint(x: 145.394592, y: 42.151161), control1: CGPoint(x: 158.083984, y: 66.236282), control2: CGPoint(x: 152.646698, y: 53.267433))
        path.addCurve(to: CGPoint(x: 141.960449, y: 36.469345), control1: CGPoint(x: 143.355881, y: 39.026161), control2: CGPoint(x: 141.810516, y: 36.469345))
        path.addCurve(to: CGPoint(x: 156.665283, y: 46.708912), control1: CGPoint(x: 142.65062, y: 36.469345), control2: CGPoint(x: 151.863159, y: 42.884407))
        path.addCurve(to: CGPoint(x: 197.05011, y: 108.086678), control1: CGPoint(x: 177.068649, y: 62.958542), control2: CGPoint(x: 191.783554, y: 85.322586))
        path.addCurve(to: CGPoint(x: 199.015106, y: 129.211792), control1: CGPoint(x: 198.62973, y: 114.914398), control2: CGPoint(x: 199.440094, y: 123.626305))
        path.addCurve(to: CGPoint(x: 196.167938, y: 145.428833), control1: CGPoint(x: 198.632538, y: 134.239944), control2: CGPoint(x: 197.084106, y: 143.05957))
        path.addCurve(to: CGPoint(x: 196.625168, y: 147.73436), control1: CGPoint(x: 195.724533, y: 146.575531), control2: CGPoint(x: 195.807632, y: 146.994492))
        path.addCurve(to: CGPoint(x: 205.006836, y: 160.531448), control1: CGPoint(x: 198.337875, y: 149.284332), control2: CGPoint(x: 202.728302, y: 155.987625))
        path.addCurve(to: CGPoint(x: 211.413544, y: 185.16806), control1: CGPoint(x: 209.176834, y: 168.847183), control2: CGPoint(x: 211.418808, y: 177.468552))
        path.addCurve(to: CGPoint(x: 209.91507, y: 193.65831), control1: CGPoint(x: 211.410904, y: 189.355286), control2: CGPoint(x: 210.741364, y: 193.147644))
        path.addCurve(to: CGPoint(x: 207.854324, y: 191.140839), control1: CGPoint(x: 209.692215, y: 193.796051), control2: CGPoint(x: 208.764877, y: 192.663177))
        path.addLine(to: CGPoint(x: 207.854324, y: 191.140839))
        path.closeSubpath()
        path.move(to: CGPoint(x: 207.854324, y: 191.140839))
        
        return path
    }
}

struct SwiftUILogoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILogoView()
    }
}
