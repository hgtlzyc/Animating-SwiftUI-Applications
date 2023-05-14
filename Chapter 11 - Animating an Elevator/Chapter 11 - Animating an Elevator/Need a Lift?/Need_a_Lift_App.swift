
import SwiftUI

@main
struct Need_a_Lift_App: App {
    @StateObject private var appData = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(appData: appData)
        }
    }
}
