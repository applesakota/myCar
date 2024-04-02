//
//  CarView.swift
//  myCar
//
//  Created by Petar Sakotic on 4/1/24.
//

import SwiftUI

struct CarView: View {
    
    let title: String
    let value: String
    let image: String
    let description: String
    
    @EnvironmentObject var theme: ThemeManager
    
    @Environment (\.CarTitleColor) var titleColor
    @Environment (\.CarValueColor) var valueColor
    @Environment (\.CarDescriptionColor) var descriptionColor
    
    var body: some View {
        
            HStack {
                Spacer()
                
                VStack(alignment: .center, spacing: 16) {
                  Text(title)
                        .themedFont(.regular, style: .callout)
                        .themeForegroundStyle(.solidGray)
                        .multilineTextAlignment(.leading)
                    
                    Text(value)
                        .themedFont(.bold, style: .title1)
                        .themeForegroundStyle(.solidGray)
                    //"section-exterior-profile-removebg-preview"
                    Image(image)
                        .resizable()
                        .scaledToFit()
                    
                    Text(description)
                        .textCase(.uppercase)
                        .themedFont(.regular, style: .callout)
                        .themeForegroundStyle(.solidGray)
                        .multilineTextAlignment(.leading)
                    
                    CircleProgressBarView(progress: 0.5, title: "⚡️", value: "50")
                }
                
                Spacer()
            }
            .padding()
            .background {
                theme.mainRedColor
            }
        }
        
}

#Preview {
    CarView(title: "Good Morning, Billy", value: "Charging your car...", image: "section-exterior-profile-removebg-preview", description: "time to end of charge 49 min")
        .environmentObject(ThemeManager())
}
