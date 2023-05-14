//
//  Find_The_ColorApp.swift
//  Find The Color
//
//  Created by Stephen DeStefano on 1/17/23.
//

import SwiftUI

@main
struct Find_The_ColorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(redGuess: 0.5, greenGuess: 0.5, blueGuess: 0.5)
        }
    }
}
