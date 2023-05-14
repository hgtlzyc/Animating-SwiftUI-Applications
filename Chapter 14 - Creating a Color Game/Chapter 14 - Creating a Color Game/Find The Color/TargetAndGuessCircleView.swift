import SwiftUI

struct TargetAndGuessCircleView: View {
    //target variables
    @Binding var redTarget: Double
    @Binding var greenTarget: Double
    @Binding var blueTarget: Double
    
    //guess variables
    @Binding var redGuess: Double
    @Binding var greenGuess: Double
    @Binding var blueGuess: Double
    
    //picker variable
    @Binding var selectedPickerIndex: Int
    
    var body: some View {
        ZStack {
            //MARK: - GUESS CIRCLE
            if selectedPickerIndex == 0 {
                Circle()
                    .fill(Color(red: redGuess, green: greenTarget, blue: blueTarget, opacity: 1.0))
                    .frame(height: 200)
            }
            else if selectedPickerIndex == 1 {
                Circle()
                    .fill(Color(red: redGuess, green: greenGuess, blue: blueTarget, opacity: 1.0))
                    .frame(height: 200)
            }
            else if selectedPickerIndex == 2 {
                Circle()
                    .fill(Color(red: redGuess, green: greenGuess, blue: blueGuess, opacity: 1.0))
                    .frame(height: 200)
            }
            
            //MARK: - TARGET CIRCLE
            Circle()
                .fill(Color(red: redTarget, green: greenTarget, blue: blueTarget, opacity: 1.0))
                .frame(height: 80)
        }.onAppear {
            redGuess = 0.0
            greenGuess = 0.0
            blueGuess = 0.0
        }
    }
}














struct TargetAndGuessCircleView_Previews: PreviewProvider {
    static var previews: some View {
        TargetAndGuessCircleView(redTarget: .constant(0.3), greenTarget: .constant(0.2), blueTarget: .constant(0.7), redGuess: .constant(0.7), greenGuess: .constant(0.4), blueGuess: .constant(0.7), selectedPickerIndex: .constant(2))
    }
}
