import SwiftUI

struct PickerView: View {
    @Binding var selectedPickerIndex: Int
    @State var levels = ["Easy 😌", "Hard 😓", "Extreme! 🥵"]
    
    var body: some View {
        VStack {
            Picker("Numbers", selection: $selectedPickerIndex) {
                    ForEach(0 ..< levels.count, id: \.self) { index in
                        Text(levels[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.yellow)
                .cornerRadius(8)
                .padding(.horizontal)
                .shadow(color: Color.black, radius: 2, y: 4)
                .padding(.top)
            
            Text("Difficulty Level: " + "\(levels[selectedPickerIndex])")
                .bold()
                .padding(5)
                .animation(.easeInOut(duration: 0.2), value: selectedPickerIndex)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(selectedPickerIndex: .constant(1))
    }
}
