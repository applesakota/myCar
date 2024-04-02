//
//  HomeView.swift
//  myCar
//
//  Created by Petar Sakotic on 4/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var theme: ThemeManager
    
    @State private var hideHeader = true
    @State private var scrollPosition: CGPoint = .zero
    
    let rows = [GridItem(.fixed(200))]
    let scrollHeight: CGFloat = 10
    
    var body: some View {
        
        ZStack {
            theme.mainRedColor.edgesIgnoringSafeArea(.top)
                
            GeometryReader { geometry in
                
                VStack {
                    if !hideHeader {
                        OffsetCarView(
                            title: "Tesla Model X",
                            value: "Charging: ⚡️50%",
                            image: "section-exterior-profile-removebg-preview"
                        )
                    } else {
                        CarView(
                            title: "Good Morning, Billy",
                            value: "Charging your car...",
                            image: "section-exterior-profile-removebg-preview",
                            description: "time to end of charge 49 min")
                    }
                    
                    ScrollView {
                        ScrollViewOffsetTracker()
                        
                        VStack {
                            HeadingView(
                                title: "Statistics",
                                value: ". . .") 
                            {
                                // Call some action
                                print("Statistics clicked")
                            }
                            .headingValueColor(.rawValue(.gray))
                            
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: rows) {
                                    StatisticItemView(
                                        icon: "car-battery-solid",
                                        title: "240 Volt",
                                        value: "Voltage"
                                    )
                                        .statisticItemIconColor(.red)
                                        .statisticItemTitleColor(.black)
                                        .statisticItemValueColor(.rawValue(.gray))
                                    StatisticItemView(
                                        icon: "battery-half-solid",
                                        title: "540 Km",
                                        value: "Remaining charge"
                                    )
                                        .statisticItemIconColor(.rawValue(.green))
                                        .statisticItemTitleColor(.black)
                                        .statisticItemValueColor(.rawValue(.gray))
                                    StatisticItemView(
                                        icon: "plug-circle-bolt-solid",
                                        title: "240 Volt",
                                        value: "Fast charger"
                                    )
                                        .statisticItemIconColor(.yellow)
                                        .statisticItemTitleColor(.black)
                                        .statisticItemValueColor(.rawValue(.gray))
                                }
                            }
                            
                            HeadingView(
                                title: "Nearby Supercharges",
                                value: "View All"
                            )
                            {
                                // Call some action
                                print("Item clicked")
                            }
                            .headingValueColor(.rawValue(.gray))
                            
                            ForEach(0...5, id: \.self) {_ in
                                SuperchargerView(title: "Rancheview Dr. Richardson", value: "4 / 10 available", distance: "1.2km", icon: "location-dot-solid")
                                    .superchargerIconColor(.rawValue(.gray))
                                    .superchargerTitleColor(.black)
                                    .superchargerValueColor(.rawValue(.gray))
                            }
                            
                        }
                        .padding()
                    }

                    .withOffsetTracking { offset in
                        
                        if offset.y != 0 {
                            withAnimation {
                                hideHeader = false
                            }
                            
                        } else {
                            withAnimation {
                                hideHeader = true
                            }
                        }
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.white)
                    }
                }


            }
        }
    }
}





#Preview {
    HomeView()
        .environmentObject(ThemeManager())
}
