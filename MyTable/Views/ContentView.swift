//
//  ContentView.swift
//  MyTable
//
//  Created by snlcom on 2023/08/12.
//

import SwiftUI

struct ContentView: View {
    
    // Binding for profile
    @EnvironmentObject var profileModel: LoadProfileData
    
    // State variable for controlling the tabView
    @State var isTabViewVisible = true
    @State var modeCheck: Bool =  false
   
    var body: some View {
        if (profileModel.profile.isLoggedIn) {
            // TODO: Hide tabView when on restaurant page
            // https://stackoverflow.com/questions/69771595/how-to-hide-tabview-navigating-from-tabitem-in-childview-in-swiftui
            TabView{
                if (isTabViewVisible) {
                    MainView(isTabViewVisible: $isTabViewVisible)
                        .tabItem{
                            Image(systemName: "house")
                            Text("Home")
                        }
                    if (profileModel.profile.isVenue) {
                        RestaurantQueue()
                            .tabItem {
                                Image(systemName: "person.2.fill")
                                Text("Queue")
                            }
                    } else {
                        SearchView()
                            .tabItem{
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                    }
                    ReservationsView()
                        .tabItem{
                            Image(systemName: "calendar")
                            Text("Reservations")
                        }
                    ProfileView(modeCheck: $modeCheck)
                        .tabItem{
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                }
            }
        } else {
            AuthenticationModule(modeCheck: $modeCheck)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabView{
            MainView(isTabViewVisible: .constant(true)).environmentObject(LoadProfileData())
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            ReservationsView()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Reservations")
                }
            ProfileView(modeCheck:.constant(true)).environmentObject(LoadProfileData())
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
        }
    }
}
