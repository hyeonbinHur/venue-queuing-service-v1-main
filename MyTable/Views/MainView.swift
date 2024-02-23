//
//  MainPage.swift
//  my_table
//
//  Created by snlcom on 2023/08/14.
//

import SwiftUI

struct MainView: View {
    // Import the restaurant data
    @ObservedObject var restaurantData = LoadRestaurantData()
    
    @Binding var isTabViewVisible: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("My Table")
                    .font(.title.bold())
                
                VStack(alignment: .leading){
                    SearchModule()
                    
                    // Restaurant list section
                    Text("Nearest tables to you")
                        .font(.title2)
                        .padding(.bottom, 0)
                        .padding(.leading, 20)
                    
                    
                    // Restaurants list
                    // They are navigation links and when clicked load the restaurant details page with their content
                    List(restaurantData.restaurants) { restaurant in
                        NavigationLink(destination: RestaurantView(restaurant: restaurant, isTabViewVisible: $isTabViewVisible)) {
                            RestaurantListItemModule(restaurant: restaurant)
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .scrollContentBackground(.hidden)
                
            }
            // Need this to account for the Tab View on the ContentView
            // so it doesn't overlap
            .padding(.bottom, 15)
        }
    }
    }
    // TODO: Create restaurant builder that loads from restaurant object
    // https://stackoverflow.com/questions/61188614/swiftui-navigate-to-different-view-from-list
}




struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TabView{
            MainView(isTabViewVisible: .constant(true)).environmentObject(LoadProfileData())
        }
    }
}
