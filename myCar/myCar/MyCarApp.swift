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
    
    var body: some View {
        VStack {
            Text(prompt)
                .themedFont(.semibold, style: .body)
                .themeForegroundStyle(.red)
            Text(prompt)
                .themedFont(.bolditalic, style: .caption1)
                .themeForegroundStyle(.red, opacity: 0.8)
            Text(prompt)
                .themedFont(.italic, style: .caption2)
                .themeForegroundStyle(.warning)
            Text(prompt)
        }
        .environmentObject(themeManager)
    }
}
