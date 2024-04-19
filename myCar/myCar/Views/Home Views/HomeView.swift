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
    
    let user: UserModel
    
    let rows = [GridItem(.fixed(200))]
    let scrollHeight: CGFloat = 10
    
    var body: some View {
        
        ZStack {
            theme.mainRedColor.edgesIgnoringSafeArea(.top)
                
            GeometryReader { geometry in
                
                VStack {
                    if !hideHeader {
                        OffsetCarView(
                            title: user.car,
                            value: "Charging: ⚡️\(user.carBattery)%",
                            image: "section-exterior-profile-removebg-preview"
                        )
                    } else {
                        CarView(
                            title: "Good Morning, \(user.name)",
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
                                        title: "\(user.voltage) Volt",
                                        value: "Voltage"
                                    )
                                        .statisticItemIconColor(.red)
                                        .statisticItemTitleColor(.black)
                                        .statisticItemValueColor(.rawValue(.gray))
                                    StatisticItemView(
                                        icon: "battery-half-solid",
                                        title: "\(user.batteryLength) Km",
                                        value: "Remaining charge"
                                    )
                                        .statisticItemIconColor(.rawValue(.green))
                                        .statisticItemTitleColor(.black)
                                        .statisticItemValueColor(.rawValue(.gray))
                                    StatisticItemView(
                                        icon: "plug-circle-bolt-solid",
                                        title: "\(user.fastCharger) Volt",
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
                            
                            ForEach(user.supercharges, id: \.id) { supercharger in
                                SuperchargerView(title: supercharger.name, value: "\(supercharger.availability) available", distance: "\(supercharger.distance) km", icon: "location-dot-solid")
                                    .superchargerIconColor(.rawValue(.gray))
                                    .superchargerTitleColor(.black)
                                    .superchargerValueColor(.rawValue(.gray))
                            }
                            
                        }
                        .padding()
                    }

                    .withOffsetTracking { offset in
                        
                        if offset.y < -50 {
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
                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                            .foregroundStyle(Color.white)
                    }
                }


            }
        }
    }
}





#Preview {
    HomeView(user: UserModel.userModelInstance)
        .environmentObject(ThemeManager())
}
