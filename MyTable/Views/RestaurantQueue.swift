//
//  RestaurantQueue.swift
//  MyTable
//
//  Created by snlcom on 2023/08/23.
//

import SwiftUI

struct RestaurantQueue: View {
   // TODO: how to get the restaurant's data?, can we save it into local storage?
    var body: some View {
        VStack{
            Text("restaurant.name")
            Image("Example1")
                .resizable()
                .frame(width: 300,height: 200)
                .cornerRadius(15)
                .padding(.bottom,20)
            Text("Queue Status")
                .padding(.bottom,15)
            Text("N teams are in the queue")
            ScrollView{
                QueueList()
                QueueList()
                QueueList()
                QueueList()
                QueueList()
                QueueList()
            }
            .frame(
            maxHeight: 300)
            HStack{
                Button("Arrived"){
                }
                .foregroundColor(.black)
                .frame(width: 150,height: 30)
                .background(
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color("ColorYellow1"))
                )
                .cornerRadius(10)
                Button("Kick"){
                }
                .foregroundColor(.black)
                .frame(width: 150,height: 30)
                .background(
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color("ColorGrey1"))
                )
                .cornerRadius(10)
            }
            .padding(.top,15)
            Spacer()
        }
    }
    func kickFromQueue(){
        //Read data and compare the name, team number and remove the data
    }
    func ArrivedRestaurant(){
        //Read data and compare the queue name, team number and remove the data
    }
}

struct RestaurantQueue_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantQueue()
    }
}
