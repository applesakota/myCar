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
                .themedFont(.bold, style: .caption1)
                .themeForegroundStyle(.red)
            Text(prompt)
                .themedFont(.bolditalic, style: .caption1)
                .themeForegroundStyle(.red, opacity: 0.8)
            Text(prompt)
                .themedFont(.italic, style: .caption1)
                .themeForegroundStyle(.warning)
            Text(prompt)
                .themedFont(.extrabold, style: .caption1)
            SuperchargerView(title: "Rancheview Dr. Richardson", value: "4 / 10 available", distance: "1.2km", icon: "location-dot-solid")
                .superchargerIconColor(.rawValue(.gray))
                .superchargerTitleColor(.black)
                .superchargerValueColor(.rawValue(.gray))
        }
        .padding()
        .environmentObject(themeManager)
    }
}
