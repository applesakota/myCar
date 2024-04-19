//
//  HeadingView.swift
//  myCar
//
//  Created by Petar Sakotic on 3/31/24.
//

import SwiftUI

struct HeadingView: View {
    let title: String
    let value: String
    let action: ()->()
    
    @EnvironmentObject var theme: ThemeManager
    
    @Environment (\.HeadingTitleColor) var titleColor
    @Environment (\.HeadingValueColor) var valueColor
    
    var body: some View {
        HStack {
            Text(title)
                .themedFont(.bold, style: .title3)
                .themeForegroundStyle(titleColor)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button {
                action()
            } label: {
                Text(value)
                    .themedFont(.bold, style: .callout)
                    .themeForegroundStyle(valueColor)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        HeadingView(title: "View All", value: ". . .") {
            print("Item clicked")
        }
        .headingValueColor(.rawValue(.gray))
        
        HeadingView(title: "View All", value: "View All") {
            print("Item clicked")
        }
        .headingValueColor(.rawValue(.gray))
    }

    .environmentObject(ThemeManager())
}
