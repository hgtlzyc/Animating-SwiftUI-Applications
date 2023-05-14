//  Created by Stephen DeStefano

import SwiftUI
///an example of a computed property - the body property is the computed property here
struct ComputedProperty: View {
    var body: some View {
            Text("Hello World")
            .padding()
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ComputedProperty()
    }
}
