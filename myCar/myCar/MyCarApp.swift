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
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    StatisticItemView(icon: "car-battery-solid", title: "240 Volt", value: "Voltage")
                        .statisticItemIconColor(.red)
                        .statisticItemTitleColor(.black)
                        .statisticItemValueColor(.rawValue(.gray))
                    StatisticItemView(icon: "battery-half-solid", title: "540 Km", value: "Remaining charge")
                        .statisticItemIconColor(.rawValue(.green))
                        .statisticItemTitleColor(.black)
                        .statisticItemValueColor(.rawValue(.gray))
                    StatisticItemView(icon: "plug-circle-bolt-solid", title: "240 Volt", value: "Fast charger")
                        .statisticItemIconColor(.yellow)
                        .statisticItemTitleColor(.black)
                        .statisticItemValueColor(.rawValue(.gray))
                }
            }
        }
        .padding()
        .environmentObject(themeManager)
    }
}
