
import SwiftUI

struct ContentView : View {
    
    
    var body: some View {
        ZStack {
            //MARK: - ADD THE GRADIENT BACKGROUND
            RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .center, startRadius: 20, endRadius: 600)
                .scaleEffect(1.2)
                //.ignoresSafeArea()
            
            //MARK: - ADD THE RECORD PLAYER BOX
            RecordPlayerBox()
            
            //MARK: - ADD THE RECORD, THE BUTTON, AND THE ARM
                RecordButtonArmView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
