//
//  RestaurantView.swift
//  MyTable
//
//  Created by Pascal Couturier on 22/8/2023.
//

import Foundation
import SwiftUI

// Restaurant View, is a more complex view, so it is broken down into sub-modules
// for each of it's main functionalities

struct RestaurantView: View {
    // Restaurant data
    @State var restaurant: RestaurantModel
    
    // Binding used to control the tab view hidden
    @Binding var isTabViewVisible: Bool
    
    @State var isFeaturedQueueView: Bool = true
    @State var isReservationView: Bool = false
    @State var isCurrentlyInQueue: Bool = false
    
    @State var reservationDate: Date = Date.now
    
    // TODO: variables that need to be attached to a model where data is received
    // displaying the active queue count will require websockets and may be
    // to time consuming to implement live integration for this for now
    @State var currentQueueCount: Int = 21
    @State var waitingTime: Int = 0
    @State var waitingTimePerTeam: Int = 5
    @State var waitingHour: Int = 0
    @State var waitingMin: Int = 0
    
    @State private var validationCode: String = ""
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("My Table")
                    .font(.title.bold())
                    .padding(.bottom, 30)
                    .padding(.top, -40)
                
                // MARK: Restaurant Details View
                RestaurantDetailsModule(restaurant: $restaurant)
                
                if (isFeaturedQueueView) {
                    
                    // MARK: Featured Section View
                    RestaurantFeaturedModule(restaurant: $restaurant, isFeaturedQueueView: $isFeaturedQueueView, isReservationView: $isReservationView)
                    
                } else if (isReservationView) {
                    
                    // MARK: Reservations View
                    RestaurantReservationModule(restaurant: $restaurant, isFeaturedQueueView: $isFeaturedQueueView, isReservationView: $isReservationView, isCurrentlyInQueue: $isCurrentlyInQueue, reservationDate: $reservationDate)
                    
                } else {
                    
                    // MARK: Queueing Related Code
                    Group {
                        if (isCurrentlyInQueue) {
                            // MARK: Currently in queue module
                            RestaurantInQueueModule(isFeaturedQueueView: $isFeaturedQueueView, isReservationView: $isReservationView, isCurrentlyInQueue: $isCurrentlyInQueue, currentQueueCount: $currentQueueCount, waitingHour: $waitingHour, waitingMin: $waitingMin)
                        } else {
                            // MARK: Join queue queue module
                            RestaurantJoinQueueModule(isFeaturedQueueView: $isFeaturedQueueView, isReservationView: $isReservationView, isCurrentlyInQueue: $isCurrentlyInQueue, currentQueueCount: $currentQueueCount, waitingTime: $waitingTime, waitingTimePerTeam: $waitingTimePerTeam, waitingHour: $waitingHour, waitingMin: $waitingMin)
                        }
                    }
                }
                Spacer()
            }
            .navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                isTabViewVisible = false
            }
            .onDisappear {
                isTabViewVisible = true
            }
        }
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        let restaurantData = LoadRestaurantData()
        RestaurantView(restaurant: restaurantData.restaurants.first!, isTabViewVisible: .constant(false))
            .padding(.top, 40)
    }
}
