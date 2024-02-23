//
//  RestaurantReservationModule.swift
//  MyTable
//
//  Created by Pascal Couturier on 25/8/2023.
//

import Foundation
import SwiftUI

// Make reservation module
// This is NOT part of MVP
struct RestaurantReservationModule: View {
    
    @Binding var restaurant: RestaurantModel
    @Binding var isFeaturedQueueView: Bool
    @Binding var isReservationView: Bool
    @Binding var isCurrentlyInQueue: Bool
    
    @Binding var reservationDate: Date
    
    var body: some View {
        // MARK: Reservations View
        Group {
            VStack {
                Text("Make a reservation")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .padding(.top, 20)
                
                // Calendar with datepicker and can't select date prior to today's date
                DatePicker("Reservation Date", selection: $reservationDate, in: Date()...)
                    
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 22)
//                            .frame(maxWidth: 250, maxHeight: 330)
                
                // TODO: create next step for addign details for booking and confirm it
                Button(action:{},label:{Text("Confirm date")
                        .foregroundColor(Color.black)
                        .frame(width: 350, height: 38)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color("ColorYellow1"))
                        )
                    
                })
                .padding(.top, -20)
                .padding(.bottom, 10)
                
                Button(action:{cancelBooking()
                },label:{Text("Cancel")
                        .foregroundColor(Color.black)
                        .frame(width: 350, height: 38)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color("ColorGrey1"))
                        )
                    
                })
            }
        }
    }
    
    // Cancel booking returns to venu details page
    func cancelBooking() {
        self.isCurrentlyInQueue = false
        self.isReservationView = false
        self.isFeaturedQueueView = true
    }
}
