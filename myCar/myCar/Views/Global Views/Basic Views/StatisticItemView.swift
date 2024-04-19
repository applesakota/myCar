//
//  StatisticItemView.swift
//  myCar
//
//  Created by Petar Sakotic on 3/30/24.
//

import SwiftUI

struct StatisticItemView: View {
    let icon: String
    let title: String
    let value: String
    
    @EnvironmentObject var theme: ThemeManager
    
    @Environment(\.StatisticItemIconColor) var iconColor
    @Environment(\.StatisticItemTitleColor) var titleColor
    @Environment(\.StatisticItemValueColor) var valueColor
    @Environment(\.StatisticItemCornerRadius) var cornerRadius
    
    var body: some View {
        
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 32) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .themeForegroundStyle(iconColor)
                    .frame(width: 24, height: 24)
                    .padding(16)
                    .background {
                        Circle()
                            .themeForegroundStyle(iconColor).opacity(0.3)
                    }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .themedFont(.bold, style: .title2)
                        .themeForegroundStyle(titleColor)
                        .multilineTextAlignment(.leading)
                    Text(value)
                        .themedFont(.regular, style: .footnote)
                        .themeForegroundStyle(valueColor)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
            
            Spacer()
        }
        .frame(width: 200)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(theme.colorPalette.color(for: .solidGray), lineWidth: 2)
            }
        }
    }
}

#Preview {
    
    VStack {
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

    .environmentObject(ThemeManager())
}
