//
//  SuperchargerView.swift
//  myCar
//
//  Created by Petar Sakotic on 3/29/24.
//

import SwiftUI

struct SuperchargerView: View {
    
    let title: String
    let value: String
    let distance: String
    let icon: String
    
    @EnvironmentObject var theme: ThemeManager
    
    @Environment(\.SuperchargerTitleColor) var titleColor
    @Environment(\.SuperchargerValueColor) var valueColor
    @Environment(\.SuperchargerDistanceColor) var distanceColor
    @Environment(\.SuperchargerIconColor) var iconColor
    @Environment(\.SuperchargerCornerRadius) var cornerRadius
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .themedFont(.semibold, style: .subheadline)
                    .themeForegroundStyle(titleColor)
                    .multilineTextAlignment(.leading)
                
                Text(value)
                    .themedFont(.regular, style: .footnote)
                    .themeForegroundStyle(valueColor)
            }
            .frame(minHeight: 44)
            
            Spacer()
            
            VStack(alignment: .center) {
                imageIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .themeForegroundStyle(iconColor)
                Text(distance)
                    .themedFont(.regular, style: .footnote)
                    .themeForegroundStyle(distanceColor)
                    .multilineTextAlignment(.leading)
            }
            .frame(minHeight: 44)
        }
        .padding(16)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .themeForegroundStyle(.solidGray)
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(theme.solidGreyColor)
            }
        }
    }
    
    var imageIcon: Image {
        if UIImage(named: icon) != nil {
            Image(icon)
        } else {
            Image(systemName: icon)
        }
    }
}

#Preview {
    VStack {
        SuperchargerView(title: "Rancheview Dr. Richardson", value: "4 / 10 available", distance: "1.2km", icon: "location-dot-solid")
            .superchargerIconColor(.solidGray)
            .superchargerTitleColor(.black)
            .superchargerValueColor(.rawValue(.gray))
        SuperchargerView(title: "Rancheview Dr. Richardson", value: "4 / 10 available", distance: "1.2km", icon: "location-dot-solid")
    }
    .environmentObject(ThemeManager())
}
