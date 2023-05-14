import SwiftUI

struct WeView: View {
    //MARK: - VARIABLES
    @State var strokeReset: Bool = true
    @State var startStroke: CGFloat = 0.0
    @State var endStroke: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Group {
                //SHAPE OUTLINE
                WeTextShape()
                    .stroke(style: StrokeStyle(lineWidth: 0.5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.gray)
                //ANIMATING STROKE
                WeTextShape()
                    .trim(from: startStroke, to: endStroke)
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.red)
            }.offset(x: 75, y: 50)
        }.onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.23, repeats: true) { timer in
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

struct WeView_Previews: PreviewProvider {
    static var previews: some View {
        WeView()
    }
}

struct WeTextShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
                path.move(to: CGPoint(x: 33.544579, y: 105.919167))
                path.addCurve(to: CGPoint(x: 20.994799, y: 60.169167), control1: CGPoint(x: 32.057159, y: 101.184097), control2: CGPoint(x: 29.932928, y: 93.440262))
                path.addCurve(to: CGPoint(x: 3.45976, y: 7.26897), control1: CGPoint(x: 8.184458, y: 12.4843), control2: CGPoint(x: 7.749718, y: 11.17275))
                path.addCurve(to: CGPoint(x: 0, y: 2.14492), control1: CGPoint(x: 1.55689, y: 5.5374), control2: CGPoint(x: 0, y: 3.23158))
                path.addLine(to: CGPoint(x: 0, y: 0.16917))
                path.addLine(to: CGPoint(x: 21.066427, y: 0.16917))
                path.addLine(to: CGPoint(x: 42.132847, y: 0.16917))
                path.addLine(to: CGPoint(x: 41.816429, y: 2.91917))
                path.addCurve(to: CGPoint(x: 39.258797, y: 5.98757), control1: CGPoint(x: 41.590286, y: 4.88451), control2: CGPoint(x: 40.860519, y: 5.76002))
                path.addCurve(to: CGPoint(x: 33.988377, y: 13.64167), control1: CGPoint(x: 36.354748, y: 6.40013), control2: CGPoint(x: 34.003067, y: 9.81543))
                path.addCurve(to: CGPoint(x: 50.075027, y: 78.403008), control1: CGPoint(x: 33.972576, y: 17.75416), control2: CGPoint(x: 49.266907, y: 79.325714))
                path.addCurve(to: CGPoint(x: 61.608868, y: 38.834583), control1: CGPoint(x: 50.428516, y: 77.999397), control2: CGPoint(x: 55.618748, y: 60.193604))
                path.addLine(to: CGPoint(x: 72.5, y: 0))
                path.addLine(to: CGPoint(x: 80.667236, y: 0.33458))
                path.addCurve(to: CGPoint(x: 89.399178, y: 1.23444), control1: CGPoint(x: 85.159218, y: 0.5186), control2: CGPoint(x: 89.088585, y: 0.92354))
                path.addCurve(to: CGPoint(x: 97.87381, y: 36.23444), control1: CGPoint(x: 89.70977, y: 1.54534), control2: CGPoint(x: 93.523346, y: 17.29534))
                path.addCurve(to: CGPoint(x: 107.039726, y: 75.169167), control1: CGPoint(x: 102.224258, y: 55.173542), control2: CGPoint(x: 106.34893, y: 72.694168))
                path.addLine(to: CGPoint(x: 108.295715, y: 79.669167))
                path.addLine(to: CGPoint(x: 110.018547, y: 74.169167))
                path.addCurve(to: CGPoint(x: 118.969727, y: 45.669167), control1: CGPoint(x: 110.966103, y: 71.144165), control2: CGPoint(x: 114.994125, y: 58.319168))
                path.addCurve(to: CGPoint(x: 121.426399, y: 5.74005), control1: CGPoint(x: 128.793228, y: 14.41163), control2: CGPoint(x: 129.206619, y: 7.69276))
                path.addCurve(to: CGPoint(x: 119, y: 2.65012), control1: CGPoint(x: 119.673515, y: 5.30011), control2: CGPoint(x: 119, y: 4.4424))
                path.addLine(to: CGPoint(x: 119, y: 0.16917))
                path.addLine(to: CGPoint(x: 135.5, y: 0.16917))
                path.addLine(to: CGPoint(x: 152, y: 0.16917))
                path.addLine(to: CGPoint(x: 152, y: 2.57039))
                path.addCurve(to: CGPoint(x: 148.553696, y: 7.00499), control1: CGPoint(x: 152, y: 4.24751), control2: CGPoint(x: 150.960754, y: 5.58479))
                path.addCurve(to: CGPoint(x: 143.182724, y: 12.85377), control1: CGPoint(x: 146.658218, y: 8.12334), control2: CGPoint(x: 144.241287, y: 10.75529))
                path.addCurve(to: CGPoint(x: 127.528923, y: 56.669167), control1: CGPoint(x: 142.124176, y: 14.95223), control2: CGPoint(x: 135.079956, y: 34.66917))
                path.addCurve(to: CGPoint(x: 112.056908, y: 101.669167), control1: CGPoint(x: 119.97789, y: 78.669167), control2: CGPoint(x: 113.01548, y: 98.919167))
                path.addLine(to: CGPoint(x: 110.314056, y: 106.669167))
                path.addLine(to: CGPoint(x: 101.214188, y: 106.95594))
                path.addLine(to: CGPoint(x: 92.114319, y: 107.242706))
                path.addLine(to: CGPoint(x: 91.148537, y: 103.744942))
                path.addCurve(to: CGPoint(x: 82.385155, y: 68.208176), control1: CGPoint(x: 90.617355, y: 101.821167), control2: CGPoint(x: 86.673836, y: 85.829628))
                path.addCurve(to: CGPoint(x: 73.999969, y: 36.16917), control1: CGPoint(x: 78.096481, y: 50.58672), control2: CGPoint(x: 74.323151, y: 36.16917))
                path.addCurve(to: CGPoint(x: 64.625938, y: 66.919167), control1: CGPoint(x: 73.676796, y: 36.16917), control2: CGPoint(x: 69.458488, y: 50.006668))
                path.addCurve(to: CGPoint(x: 54.339378, y: 102.419167), control1: CGPoint(x: 59.793388, y: 83.831665), control2: CGPoint(x: 55.164436, y: 99.806671))
                path.addLine(to: CGPoint(x: 52.839268, y: 107.169167))
                path.addLine(to: CGPoint(x: 43.388248, y: 107.169167))
                path.addCurve(to: CGPoint(x: 33.544579, y: 105.919167), control1: CGPoint(x: 36.703518, y: 107.169167), control2: CGPoint(x: 33.822296, y: 106.803299))
                path.addLine(to: CGPoint(x: 33.544579, y: 105.919167))
                path.closeSubpath()
                path.move(to: CGPoint(x: 159, y: 104.854378))
                path.addCurve(to: CGPoint(x: 162.473755, y: 100.88308), control1: CGPoint(x: 159, y: 103.196815), control2: CGPoint(x: 159.986282, y: 102.069267))
                path.addCurve(to: CGPoint(x: 166.723755, y: 96.447868), control1: CGPoint(x: 164.701385, y: 99.820786), control2: CGPoint(x: 166.225952, y: 98.22979))
                path.addCurve(to: CGPoint(x: 166.760849, y: 11.03825), control1: CGPoint(x: 167.713776, y: 92.903946), control2: CGPoint(x: 167.747803, y: 14.55116))
                path.addCurve(to: CGPoint(x: 162.510849, y: 6.74133), control1: CGPoint(x: 166.301407, y: 9.40298), control2: CGPoint(x: 164.693039, y: 7.77685))
                path.addCurve(to: CGPoint(x: 159, y: 2.61051), control1: CGPoint(x: 159.896576, y: 5.50079), control2: CGPoint(x: 159, y: 4.44588))
                path.addLine(to: CGPoint(x: 159, y: 0.14568))
                path.addLine(to: CGPoint(x: 197.75, y: 0.40742))
                path.addLine(to: CGPoint(x: 236.5, y: 0.66917))
                path.addLine(to: CGPoint(x: 236.781189, y: 12.97))
                path.addLine(to: CGPoint(x: 237.062378, y: 25.27083))
                path.addLine(to: CGPoint(x: 231.406372, y: 24.969999))
                path.addLine(to: CGPoint(x: 225.750351, y: 24.66917))
                path.addLine(to: CGPoint(x: 224.125168, y: 20.63936))
                path.addCurve(to: CGPoint(x: 201.75, y: 9.21306), control1: CGPoint(x: 220.308548, y: 11.17562), control2: CGPoint(x: 216.596329, y: 9.2799))
                path.addLine(to: CGPoint(x: 192, y: 9.16916))
                path.addLine(to: CGPoint(x: 192, y: 28.169161))
                path.addLine(to: CGPoint(x: 192, y: 47.169163))
                path.addLine(to: CGPoint(x: 198.452957, y: 47.169163))
                path.addCurve(to: CGPoint(x: 211.60994, y: 40.520454), control1: CGPoint(x: 207.001419, y: 47.169163), control2: CGPoint(x: 209.565659, y: 45.873363))
                path.addLine(to: CGPoint(x: 213.271729, y: 36.169159))
                path.addLine(to: CGPoint(x: 217.635864, y: 36.169159))
                path.addLine(to: CGPoint(x: 222, y: 36.169159))
                path.addLine(to: CGPoint(x: 222, y: 51.669163))
                path.addLine(to: CGPoint(x: 222, y: 67.169159))
                path.addLine(to: CGPoint(x: 217.57756, y: 67.169159))
                path.addLine(to: CGPoint(x: 213.155106, y: 67.169159))
                path.addLine(to: CGPoint(x: 212.005157, y: 63.684795))
                path.addCurve(to: CGPoint(x: 198.865143, y: 56.169163), control1: CGPoint(x: 210.14505, y: 58.048615), control2: CGPoint(x: 206.8591, y: 56.169163))
                path.addLine(to: CGPoint(x: 192, y: 56.169163))
                path.addLine(to: CGPoint(x: 192, y: 77.255211))
                path.addLine(to: CGPoint(x: 192, y: 98.34127))
                path.addLine(to: CGPoint(x: 203.43045, y: 98.005211))
                path.addCurve(to: CGPoint(x: 217.68045, y: 95.563194), control1: CGPoint(x: 213.170471, y: 97.718857), control2: CGPoint(x: 215.277878, y: 97.357719))
                path.addCurve(to: CGPoint(x: 226.5, y: 81.153603), control1: CGPoint(x: 220.219925, y: 93.666435), control2: CGPoint(x: 223.780838, y: 87.848526))
                path.addCurve(to: CGPoint(x: 232, y: 79.021095), control1: CGPoint(x: 227.38736, y: 78.968842), control2: CGPoint(x: 228.006943, y: 78.728615))
                path.addCurve(to: CGPoint(x: 236.855713, y: 79.698975), control1: CGPoint(x: 234.475006, y: 79.202385), control2: CGPoint(x: 236.66008, y: 79.507431))
                path.addCurve(to: CGPoint(x: 236.485107, y: 93.6082), control1: CGPoint(x: 237.051361, y: 79.890518), control2: CGPoint(x: 236.884613, y: 86.149673))
                path.addLine(to: CGPoint(x: 235.758789, y: 107.169159))
                path.addLine(to: CGPoint(x: 197.379395, y: 107.169159))
                path.addLine(to: CGPoint(x: 159, y: 107.169159))
                path.addLine(to: CGPoint(x: 159, y: 104.854378))
                path.closeSubpath()
                path.move(to: CGPoint(x: 159, y: 104.854378))
        return path
    }
}




