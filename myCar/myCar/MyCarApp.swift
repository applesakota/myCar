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
    @StateObject var userViewModel = UserViewModel()
    
    @State private var appFinishedLoadingData = false
    
    @State var user: UserModel?
    
    var body: some View {
        
        ZStack {
            if appFinishedLoadingData {
                
                TabView {
                    Group {
                        HomeView(user: user ?? UserModel.userModelInstance)
                            .tabItem {
                                Image(systemName: "car.fill")
                                    .resizable()
                                    .scaledToFit()
                                
                            }
                            .environmentObject(themeManager)
                        Text("Search View")
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                
                            }
                        Text("Map View")
                            .tabItem {
                                Image(systemName: "map")
                                    .resizable()
                                    .scaledToFit()
                                
                            }
                        
                        Text("Profile View")
                            .tabItem {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                            }
                    }
                }
                .tint(themeManager.mainRedColor)
            }
        }
        .onAppear {
            Task {
                user = await userViewModel.fetchData()
                appFinishedLoadingData = true
            }
        }
        
    }
}
