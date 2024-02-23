//
//  RestaurantProfileView.swift
//  MyTable
//
//  Created by snlcom on 2023/08/23.
//

import SwiftUI

struct RestaurantProfileView: View {
    
    @EnvironmentObject var profileModel: LoadRestaurantData
    @State private var isEditing: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Profile")
                Image("Example1")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(5)
                //            Text(profileModel.restaurants.name)
                Text("Example 1")
                    .padding(.bottom,50)
                VStack{
                    NavigationLink(destination: RestaurantQueue()){
                        Button(action: {print("abc")} ,label: {Text("Check My Queue")}
                        )
                        .foregroundColor(.black)
                        .frame(width: 300, height: 38)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color("ColorYellow1"))
                        )
                        .cornerRadius(10)
                        .padding(.top,50)
                        .padding(.bottom,30)
                    }
                    Divider()
                        .padding(.leading,30)
                        .padding(.trailing,30)
                        .padding(.bottom,30)
                    
                    Button("Edit Profile"){
                        isEditing.toggle()
                    }
                        .foregroundColor(.black)
                        .frame(width: 300, height: 38)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color("ColorYellow1"))
                        )
                        .cornerRadius(10)
                        .padding(.top,20)
                        .padding(.bottom,10)
                        
                    Button(action: {logout()}, label: {Text("Logout")})
                        .foregroundColor(Color.black)
                        .frame(width: 300, height: 38)
                    
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color("ColorGrey1"))
                        )
                    Spacer()
                }
            }
            .fullScreenCover(isPresented: $isEditing){
                
            } content: {
                EditRestaurantProfile(isEditing: $isEditing)
            }
        }
    }
    func logout() {
       
    }
    
}

struct RestaurantProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantProfileView()
    }
}
