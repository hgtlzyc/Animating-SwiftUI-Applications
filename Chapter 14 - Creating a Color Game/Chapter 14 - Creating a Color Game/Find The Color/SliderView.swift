

import SwiftUI

struct SliderView: View {
    @Binding var redGuess: Double
    @Binding var greenGuess: Double
    @Binding var blueGuess: Double
    @Binding var selectedPickerIndex: Int
    
    var body: some View {
        //MARK: - SLIDERS FOR THE GUESS CIRCLE
        VStack {
            //red slider - this slider will always be visible and represents the “Easy” option on the picker
            CreateSlider(value: $redGuess, color: .red)
                .background(Capsule().stroke(Color.red, lineWidth: 3))
                .padding(.horizontal)
                .accentColor(.red)
                .padding(5)
            
            switch selectedPickerIndex {
            case 1:
                //green slider - shown when the "Hard" option is selected
                CreateSlider(value: $greenGuess, color: .green)
                    .background(Capsule().stroke(Color.green, lineWidth: 4))
                    .padding(.horizontal)
                    .accentColor(.green)
                    .padding(5)
            case 2:
                //blue slider - this is shown when the “Extreme” option is selected
                CreateSlider(value: $greenGuess, color: .green)
                    .background(Capsule().stroke(Color.green, lineWidth: 4))
                    .padding(.horizontal)
                    .accentColor(.green)
                    .padding(5)
                
                CreateSlider(value: $blueGuess, color: .blue)
                    .background(Capsule().stroke(Color.blue, lineWidth: 4))
                    .padding(.horizontal)
                    .accentColor(.blue)
                    .padding(5)
            default:
                EmptyView()
            }
        }
    }
}

struct CreateSlider: View {
    @Binding var value: Double
    var color: Color
    
    var body: some View {
        HStack {
            Text("0")
                .bold()
                .foregroundColor(color)
            
            Slider(value: $value, in: 0.0...1.0)
            Text("255")
                .bold()
                .foregroundColor(color)
        }.padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}


struct StyleTheSliders_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(redGuess: .constant(0.5), greenGuess: .constant(0.5), blueGuess: .constant(0.5), selectedPickerIndex: .constant(1))
    }
}














//ORIGINAL CODE TO CREATE THE SLIDERS USING AN IF STATMENT
//VStack {
//    //red slider - this slider will always be visible
//    CreateSlider(value: $redGuess, color: .red)
//        .background(Capsule().stroke(Color.red, lineWidth: 3))
//        .padding(.horizontal)
//        .accentColor(.red)
//        .padding(5)
//
//    //green slider - shown when the "Hard" option is selected
//    if pickerLevelIndex == 1 {
//        CreateSlider(value: $greenGuess, color: .green)
//        .background(Capsule().stroke(Color.green, lineWidth: 4))
//        .padding(.horizontal)
//        .accentColor(.green)
//        .padding(5)
//    }
//
//    //blue slider - this is shown when the "Good Luck" option is selected
//    else if pickerLevelIndex == 2 {
//        CreateSlider(value: $greenGuess, color: .green)
//        .background(Capsule().stroke(Color.green, lineWidth: 4))
//        .padding(.horizontal)
//        .accentColor(.green)
//        .padding(5)
//
//        CreateSlider(value: $blueGuess, color: .blue)
//        .background(Capsule().stroke(Color.blue, lineWidth: 4))
//        .padding(.horizontal)
//        .accentColor(.blue)
//        .padding(5)
//
//    }
//}
