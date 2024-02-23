//
//  CustomerProfileView.swift
//  MyTable
//
//  Created by snlcom on 26/8/2023.
//

import SwiftUI

struct CustomerProfileView: View {
    @EnvironmentObject var profileModel: LoadProfileData
    @State private var isEditing: Bool = false
    var body: some View {
        NavigationView{
            VStack {
                Text("Welcome \(profileModel.profile.firstName)")
                    .font(.title.bold())
                if (profileModel.profile.avatarUrl.isEmpty) {
                    Image(systemName: "person")
                        .resizable()
                        .padding(30)
                        .frame(width: 150, height: 150)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color("ColorYellow1"))
                        )
                } else {
                    Image(profileModel.profile.avatarUrl)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                        )
                }
                Text("\(profileModel.profile.firstName)")
                    .font(.headline)
                
                
                Button("Edit Profile"){
                    isEditing = true
                }
                .foregroundColor(.black)
                .frame(width: 300, height: 38)
                .background(
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color("ColorYellow1"))
                )
                .cornerRadius(10)
                .padding(.top,10)
                .padding(.bottom,30)
                Divider()
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom,30)
                
                Button(action: {logout()}, label: {Text("Logout")})
                    .foregroundColor(Color.black)
                    .frame(width: 300, height: 38)
                    .background(
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color("ColorGrey1"))
                    )
                }
                Spacer()
            }
        .fullScreenCover(isPresented: $isEditing){
            
        } content: {
            EditProfile(isEditing: $isEditing)
        }
        }
    
    func logout() {
        self.profileModel.clearProfileData()
    
    }
}

struct CustomerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerProfileView().environmentObject(LoadProfileData())
    }
}
