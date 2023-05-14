
import SwiftUI

struct PickerView: View {
    @ObservedObject var appData = DataModel()

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            //bar
            Image("topBar").resizable()
                .frame(width: 280, height: 8)
                .padding(.bottom, 10)
                .shadow(color: .black, radius: 1, x: 1, y: 1)

            Picker("", selection: $appData.selectedSegment) {
                Text("7 Letter").tag(1)
                Text("8 Letter").tag(2)
                Text("9 Letter").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 4).shadow(color: Color.black, radius: 8, x: 0, y: 0))
            .cornerRadius(8)
            .padding(.horizontal, 50.0)
            .padding(.bottom, 10)
           
            Image("bottomBar").resizable()
                .frame(width: 280, height: 8)
                .padding(.bottom, 10)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
        }
    }
}



struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
            .previewLayout(.fixed(width: 375, height: 100))
    }
}


