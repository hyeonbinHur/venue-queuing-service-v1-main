//
//  EditRestaurantProfile.swift
//  MyTable
//
//  Created by snlcom on 2023/08/23.
//

import SwiftUI

struct EditRestaurantProfile: View {
    // Binding for profile
    
    @EnvironmentObject var profileModel: LoadProfileData
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State private var websiteUrl: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State private var menuUrl: String = ""
    @State private var slug: String = ""
    
    // Validation variables
    @State private var isName: Bool = true
    @State private var isPhone: Bool = true
    @State private var isWebsiteUrl: Bool = true
    @State private var isLatitude: Bool = true
    @State private var isLongitude: Bool = true
    @State private var isMenuUrl: Bool = true
    
    @State private var isValid : Bool = false
    @Binding var isEditing: Bool
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Button{isEditing = false}
                    label:{
                        Image(systemName: "chevron.backward")
                        Text("Back")
                        
                    }
                    .padding(.leading,20)
                    
                    Spacer()
                }
                Spacer()
            }
            .padding(.bottom,10)
            
            
            ScrollView(.horizontal){
                
                HStack(spacing : 10){
                    ZStack(alignment: .trailing){
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 180,height: 180)
                            .cornerRadius(30)
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .padding(.trailing,20)
                            .padding(.top,120)
                    }
                    .padding(.leading,15)
                    
                    VStack{
                        ZStack(alignment: .trailing){
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 80,height: 80)
                                .cornerRadius(15)
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 15,height: 15)
                                .padding(.trailing,8)
                                .padding(.top,50)
                        }
                        ZStack(alignment: .trailing){
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 80,height: 80)
                                .cornerRadius(15)
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 15,height: 15)
                                .padding(.trailing,8)
                                .padding(.top,50)
                        }
                    }
                    
                    VStack{
                        ZStack(alignment: .trailing){
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 80,height: 80)
                                .cornerRadius(15)
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 15,height: 15)
                                .padding(.trailing,8)
                                .padding(.top,50)
                        }
                        ZStack(alignment: .trailing){
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 80,height: 80)
                                .cornerRadius(15)
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 15,height: 15)
                                .padding(.trailing,8)
                                .padding(.top,50)
                        }
                    }
                }
            }
            .padding(.bottom,15)
            VStack(spacing: 15){
                VStack(alignment: .leading,spacing: 5){
                    Text("Business registration number")
                        .padding(.leading,25)
                    TextField("", text : $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                }
                
                VStack(alignment: .leading,spacing: 5){
                    Text("Restaurant name")
                        .padding(.leading,25)
                    TextField("", text : $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    if (!isName) {
                        Text("Includes @ in your email")
                            .foregroundColor(Color.red)
                    }
                }
                VStack(alignment: .leading,spacing: 5){
                    Text("Restaurant phone number")
                        .padding(.leading,25)
                    TextField("", text : $phoneNumber)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    if (!isPhone) {
                        Text("Includes @ in your email")
                            .foregroundColor(Color.red)
                    }
                }

                VStack(alignment: .leading,spacing: 5){
                    Text("Restaurant Slug")
                        .padding(.leading,25)
                    TextField("", text : $slug)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .keyboardType(.numberPad)
                    
                }
                VStack(alignment: .leading,spacing: 5){
                    Text("Restaurant latitude")
                        .padding(.leading,25)
                    TextField("", text : $latitude)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    if (!isLatitude) {
                        Text("Username must not be less than 6 letters")
                            .foregroundColor(Color.red)
                    }
                }
                
                VStack(alignment: .leading,spacing: 5){
                    Text("Restaurant longitude")
                        .padding(.leading,25)
                    TextField("", text : $longitude)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    if (!isLongitude) {
                        Text("Username must not be less than 6 letters")
                            .foregroundColor(Color.red)
                    }
                }
                VStack(alignment: .leading,spacing: 5){
                    Text("Restaurant website url")
                        .padding(.leading,25)
                    TextField("", text : $websiteUrl)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    if (!isWebsiteUrl) {
                        Text("Username must not be less than 6 letters")
                            .foregroundColor(Color.red)
                    }
                }
                VStack(alignment: .leading,spacing: 5){
                    Text("Restaurant menu url")
                        .padding(.leading,25)
                    TextField("", text : $menuUrl)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    if (!isMenuUrl) {
                        Text("Username must not be less than 6 letters")
                            .foregroundColor(Color.red)
                    }
                }
                
                Button(action: {submitted()} ,label: {Text("Edit Profile")}
                )
                .foregroundColor(.black)
                .padding(.horizontal,90)
                .padding(.vertical,10)
                .background(
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color("ColorYellow1"))
                )
                .cornerRadius(10)
                .padding(.top,50)
            }
            Spacer()
    
        }

    }
    
    func submitted() {
        isName = nameValid()
        isPhone = phoneNumberValid()
        isWebsiteUrl = webUrlValid()
        isLatitude = latitudeValid()
        isLongitude = longitudeValid()
        isMenuUrl = menuUrlValid()
        if (
            isName ||
            isPhone ||
            isWebsiteUrl ||
            isLatitude ||
            isLongitude ||
            isMenuUrl
        ) {
            isValid = true;
            isEditing = true;
        }
    }
    
    func nameValid() -> Bool{
        return name.isEmpty ? false : true
    }
    func phoneNumberValid() -> Bool{
        return phoneNumber.isEmpty ? false : true
    }
    func latitudeValid() -> Bool{
        return latitude.isEmpty ? false : true
    }
    func longitudeValid() -> Bool{
        return longitude.isEmpty ? false : true
    }
    func webUrlValid() -> Bool{
        return websiteUrl.isEmpty ? false : true
    }
    
    func menuUrlValid() -> Bool{
        return menuUrl.isEmpty ? false : true
    }
    
}

struct EditRestaurantProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditRestaurantProfile(isEditing: .constant(true)).environmentObject(LoadProfileData())
    }
}
