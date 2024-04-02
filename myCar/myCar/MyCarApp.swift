//
//  MyCarApp.swift
//  myCar
//
//  Created by Petar Sakotic on 3/27/24.
//

import SwiftUI

@main
struct MyCarApp: App {
    var body: some Scene {
        WindowGroup {
            AppStartingView()
        }
    }
}

struct AppStartingView: View {
    
    @StateObject var themeManager = ThemeManager()
    let prompt = "Welcome to myCar, enjoy your first look around"
    let rows = [GridItem(.fixed(200))]
    
    var body: some View {
        HomeView()
            .environmentObject(themeManager)
    }
}
