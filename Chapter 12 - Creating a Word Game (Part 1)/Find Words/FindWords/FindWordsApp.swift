
import SwiftUI

@main
struct FindWordsApp: App {
    @StateObject private var appData = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(appData: DataModel())
        }
    }
}
