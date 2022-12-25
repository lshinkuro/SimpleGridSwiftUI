//
//  SimpleGridSiftUIApp.swift
//  SimpleGridSiftUI
//
//  Created by nur kholis on 17/12/22.
//

import SwiftUI



@main
struct SimpleGridSiftUIApp: App {
    
    @StateObject var router = TabRouter()
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $router.screen) {
                ScreenOne()
                    .badge(10)
                    .tag(Screen.one)
                    .environmentObject(router)
                    .tabItem {
                        Label(title: {
                                 Text("Home")
                             }, icon: {
                                 Image(systemName: "house.fill")
                                     .renderingMode(.template)
                             }
                        )
                }
                ScreenTwo()
                    .tag(Screen.two)
                    .environmentObject(router)
                    .tabItem {
                        Label(title: {
                                 Text("Calender")
                             }, icon: {
                                 Image(systemName: "calendar")
                                     .renderingMode(.template)
                             }
                        )
                              
                    }
                ScreenThree()
                    
                    .tag(Screen.three)
                    .environmentObject(router)
                    .tabItem {
                        Label(title: {
                                 Text("Profile")
                             }, icon: {
                                 Image(systemName: "person.fill")
                                     .renderingMode(.template)
                             }
                        )
                              
                    }
                ScreenFour()
                    .tag(Screen.four)
                    .environmentObject(router)
                    .tabItem {
                        Label(title: {
                                 Text("Kits")
                             }, icon: {
                                 Image(systemName: "brain.head.profile")
                                     .renderingMode(.template)
                             }
                        )
                              
                    }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
