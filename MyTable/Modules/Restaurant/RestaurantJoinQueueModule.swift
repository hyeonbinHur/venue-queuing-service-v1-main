//
//  RestaurantJoinQueueModule.swift
//  MyTable
//
//  Created by Pascal Couturier on 26/8/2023.
//

import Foundation
import SwiftUI

// Module that handles the joining of a restaurant queue
struct RestaurantJoinQueueModule: View {
    
    @Binding var isFeaturedQueueView: Bool
    @Binding var isReservationView: Bool
    @Binding var isCurrentlyInQueue: Bool
    
    // TODO: variables that need to be attached to a model where data is received
    // displaying the active queue count will require websockets and may be
    // to time consuming to implement live integration for this for now
    @Binding var currentQueueCount: Int
    @Binding var waitingTime: Int
    @Binding var waitingTimePerTeam: Int
    @Binding var waitingHour: Int
    @Binding var waitingMin: Int
    
    @State private var validationCode: String = ""
    
    var body: some View {
        VStack {
            Text("Join the queue")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                .padding(.top, 20)
            ZStack {
                Circle()
                    .frame(width: 150)
                    .foregroundColor(Color("ColorGrey1"))
                    .padding(.top, 30)
                Text("\(currentQueueCount)")
                    .font(.largeTitle.bold())
                    .padding(.top, 20)
            }
            
            Text("\(currentQueueCount) people in the queue!")
            
            // Validation code input
            // TODO: add send code and validation code functionality
            VStack(alignment: .leading) {
                Text("Validation code")
                    .font(.headline)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: -5, trailing: 0))
                TextField("Validation code", text: $validationCode)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, 0)
                Text("Enter the code that was sent to your device")
                    .font(.footnote)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: -5, trailing: 0))
                    .opacity(0.4)
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 30, trailing: 30))
            
            Button(action:{validateCodeAndJoinQueue()},label:{Text("Validate code and join the queue")
                    .foregroundColor(Color.black)
                    .frame(width: 350, height: 38)
                    .background(
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color("ColorYellow1"))
                    )
                
            })
            .padding(.top, 0)
            
            Button(action:{leaveQueue()
            },label:{Text("Cancel")
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
    
    func validateCodeAndJoinQueue() {
        // TODO: add functionality to validate code and add user to queue and map with restaurant
        self.currentQueueCount += 1
        self.isCurrentlyInQueue = true
        waitingTimeCalculation()
    }
    
    // When leaving the queue, goes back to venu details view
    // TODO: remove self from queue with both venue and user
    func leaveQueue() {
        self.currentQueueCount -= 1
        self.isCurrentlyInQueue = false
        self.isReservationView = false
        self.isFeaturedQueueView = true
    }
    
    
    func waitingTimeCalculation(){
        waitingTime = currentQueueCount*waitingTimePerTeam
        waitingHour = waitingTime/60
        waitingMin = waitingTime%60
    }
}
