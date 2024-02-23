//
//  MyTableApp.swift
//  MyTable
//
//  Created by Pascal Couturier on 6/8/2023.
//

import SwiftUI

@main
struct MyTableApp: App {
    // Load the user profile data
    @StateObject var profileModel = LoadProfileData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(profileModel)
        }
    }
}
