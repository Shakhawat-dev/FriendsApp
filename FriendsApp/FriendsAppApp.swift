//
//  FriendsAppApp.swift
//  FriendsApp
//
//  Created by Shakhawat Hossain Shahin on 29/3/23.
//

import SwiftUI

@main
struct FriendsAppApp: App {
    @StateObject var vm: FriendsViewModel = FriendsViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                FriendsGridView()
                    .environmentObject(vm)
                    
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
