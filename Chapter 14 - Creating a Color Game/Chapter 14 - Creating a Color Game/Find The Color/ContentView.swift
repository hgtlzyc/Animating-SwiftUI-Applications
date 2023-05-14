
import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    //target variables
    @State var redTarget = Double.random(in: 0..<1)
    @State var greenTarget = Double.random(in: 0..<1)
    @State var blueTarget = Double.random(in: 0..<1)
    
    //guess variables
    @State var redGuess: Double
    @State var greenGuess: Double
    @State var blueGuess: Double
    
    //picker variable
    @State var selectedPickerIndex = 1
    
    //user feedback variable
    @State var showAlert = false
    
    //confetti variable
    @State var counter = 0
    
    var body: some View {
        VStack {
                //MARK: - TITLE
            TitleView().padding()
            
            //MARK: - TARGET AND GUESS CIRCLES
            TargetAndGuessCircleView(redTarget: $redTarget, greenTarget: $greenTarget, blueTarget: $blueTarget, redGuess: $redGuess, greenGuess: $greenGuess, blueGuess: $blueGuess, selectedPickerIndex: $selectedPickerIndex)
            
            //MARK: - PICKER
            PickerView(selectedPickerIndex: $selectedPickerIndex)
            
            //MARK: - TARGET AND GUESS RECTANGLES
            TargetAndGuessRectView(redTarget: $redTarget, greenTarget: $greenTarget, blueTarget: $blueTarget, redGuess: $redGuess, greenGuess: $greenGuess, blueGuess: $blueGuess, selectedPickerIndex: $selectedPickerIndex)
            
            //MARK: - CONFETTI CANNON
                .confettiCannon(counter: $counter, num: 100, colors: [.pink, .red, .blue, .purple, .orange], rainHeight: 1800.0, radius: 500.0)
            
            //MARK: - SLIDER
            Spacer()
            SliderView(redGuess: $redGuess, greenGuess: $greenGuess, blueGuess: $blueGuess, selectedPickerIndex: $selectedPickerIndex)
                .scaleEffect(1)
                .animation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5), value: selectedPickerIndex)
                
            Spacer()
            
            //MARK: - BUTTON
            Button(action: {
                showAlert = true
                //if a score of 100 is achieved, make the confetti fall by adding 1 to the counter variable
                if calculateScore() == 100 {
                    counter += 1
                }
            }) {
                Text("Check Score")
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(Color.yellow)
                    .cornerRadius(20)
                    .shadow(color: Color.black, radius: 2, y: 4)
            }.alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Your Score"), message: Text("\(calculateScore())"),
                      primaryButton: Alert.Button.default(Text("Continue Playing?"), action: {
                }),
                      secondaryButton: Alert.Button.destructive(Text("New Game?"), action: {
                    // Start a new game?
                    reset()
                }))
            }
        }.background(Image("background").resizable().edgesIgnoringSafeArea(.all))
    }
    
    //MARK: - CALCULATE THE SCORE
    func calculateScore() -> Int {
        let redDiff = redGuess - redTarget
        let greenDiff = greenGuess - greenTarget
        let blueDiff = blueGuess - blueTarget
        let easyDifference = redDiff * redDiff
        let hardDifference = easyDifference + greenDiff * greenDiff
        let extremeDifference = hardDifference + blueDiff * blueDiff
        
        let calculatedDifference: Double
        switch selectedPickerIndex {
            case 0:
                calculatedDifference = sqrt(easyDifference)
            case 1:
                calculatedDifference = sqrt(hardDifference)
            case 2:
                calculatedDifference = sqrt(extremeDifference)
            default:
                calculatedDifference = 0.0
        }
        return Int((1.0 - calculatedDifference) * 100 + 0.5)
    }
    
    //MARK: - RESET THE GAME
    func reset() {
        redTarget = Double.random(in: 0..<1)
        greenTarget = Double.random(in: 0..<1)
        blueTarget = Double.random(in: 0..<1)
        redGuess = 0.0
        greenGuess = 0.0
        blueGuess = 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(redGuess: 0.5, greenGuess: 0.5, blueGuess: 0.5)
    }
}
