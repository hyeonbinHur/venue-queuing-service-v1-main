//
//  RestaurantInQueueModule.swift
//  MyTable
//
//  Created by Pascal Couturier on 25/8/2023.
//

import Foundation
import SwiftUI

// Module that handles the display of when a user is currently waiting in a queue
// for the specific restaurant
struct RestaurantInQueueModule: View {
    
    @Binding var isFeaturedQueueView: Bool
    @Binding var isReservationView: Bool
    @Binding var isCurrentlyInQueue: Bool
    
    // TODO: variables that need to be attached to a model where data is received
    // displaying the active queue count will require websockets and may be
    // to time consuming to implement live integration for this for now
    @Binding var currentQueueCount: Int
    @Binding var waitingHour: Int
    @Binding var waitingMin: Int
    
    var body: some View {
        VStack {
            Text("My Table queue")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                .padding(.top, 20)
            
            Text("Your number:")
                .font(.footnote.bold())
                .padding(.top)
            Text("\(currentQueueCount)")
                .font(.largeTitle)
            
            Group {
                Text("Details")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .padding(.top, 20)
                
                // TODO: create dummy data and add to model
                HStack {
                    Text("Date joined:")
                        .font(.footnote.bold())
                    Text("10/08/2023")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                .padding(.top, 2)
                
                // TODO: create dummy data and add to model
                HStack {
                    Text("Time joined:")
                        .font(.footnote.bold())
                    Text("\(waitingHour):\(waitingMin) pm")
                        .font(.footnote)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                .padding(.top, 2)
            }
            
            Spacer()
            
            Button(action:{leaveQueue()
            },label:{Text("Leave queue")
                    .foregroundColor(Color.black)
                    .frame(width: 350, height: 38)
                    .background(
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color("ColorGrey1"))
                    )
                
            })
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
    }
    
    // when leaving the queue the user goes back to the main venue details
    // TODO: remove self from queue with both venue and user
    func leaveQueue() {
        self.currentQueueCount -= 1
        self.isCurrentlyInQueue = false
        self.isReservationView = false
        self.isFeaturedQueueView = true
    }
}
