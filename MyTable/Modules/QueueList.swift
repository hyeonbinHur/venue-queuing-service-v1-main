//
//  QueueList.swift
//  MyTable
//
//  Created by snlcom on 2023/08/23.
//

import SwiftUI

// The queue list item
struct QueueList: View {
    var body: some View {
            VStack(){
                Text("Name")
                    .padding(.top,10)
                    .padding(.bottom, 5)
                Text("Team number")
            }
            .frame(
                  maxWidth: 300,
                  minHeight: 70,
                  maxHeight: 100,
                  alignment: .top
                )
            .background(Color("ColorYellow1"))
            .cornerRadius(20)
    }
}


