//
//  CircleProgressBarView.swift
//  myCar
//
//  Created by Petar Sakotic on 4/1/24.
//

import SwiftUI

struct CircleProgressBarView: View {
    
    let progress: Double
    let title: String
    let value: String
    
    @EnvironmentObject var theme: ThemeManager
    
    @Environment (\.CarCircleIconColor) var circleIconColor
    @Environment (\.CarCircleValueColor) var circleValueColor
    @Environment (\.CarCircleStrokeColor) var strokeColor
    
    var body: some View {

        VStack {
            Text(title)
                .themedFont(.bold, style: .title3)
                .themeForegroundStyle(circleValueColor)
            Text(value)
                .themedFont(.bold, style: .title3)
                .themeForegroundStyle(circleValueColor)
        }
        .frame(width: 70, height: 70)
        .overlay {
            ZStack {
                Circle()
                    .stroke(theme.solidGreyColor.opacity(0.5), lineWidth: 5)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(theme.solidGreyColor, style: StrokeStyle(
                        lineWidth: 5, lineCap: .round
                    ))
                    .rotationEffect(.degrees(-90))
            }
        }
        
    }
}

#Preview {
    CircleProgressBarView(progress: 0.7, title: "⚡️", value: "20")
        .environmentObject(ThemeManager())
}
