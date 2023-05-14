
import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            Text("Find").foregroundColor(.red)
            Text("The").foregroundColor(.green)
            Text("Color").foregroundColor(.blue)
        } .foregroundColor(.blue)
            .fontWeight(.black)
            .font(Font.system(size: 35, design: .serif))
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
