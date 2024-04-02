//
//  OffsetCarView.swift
//  myCar
//
//  Created by Petar Sakotic on 4/1/24.
//

import SwiftUI

struct OffsetCarView: View {
    
    let title: String
    let value: String
    let image: String
    
    @EnvironmentObject var theme: ThemeManager
    
    @Environment (\.CarTitleColor) var titleColor
    @Environment (\.CarValueColor) var valueColor
    @Environment (\.CarDescriptionColor) var descriptionColor
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                      .themedFont(.regular, style: .callout)
                      .themeForegroundStyle(.solidGray)
                      .multilineTextAlignment(.leading)
                  
                  Text(value)
                      .themedFont(.bold, style: .callout)
                      .themeForegroundStyle(.solidGray)
                      .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            Image(image)
                .resizable()
                .scaledToFit()
        }
        .padding()
        .background {
            theme.mainRedColor
        }
    }
}

#Preview {
    OffsetCarView(title: "Tesla Model X", value: "Charging: ⚡️50%", image: "section-exterior-profile-removebg-preview")
        .environmentObject(ThemeManager())
}
