//
//  SignUpPage.swift
//  my_table
//
//  Created by snlcom on 2023/08/13.
//

import SwiftUI

struct SignUpView: View {
    // Set check for if login or signup page
    @Binding var isSignup: Bool
    
    // Binding for profile
    @EnvironmentObject var profileModel: LoadProfileData
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var userId: String = ""
    @State private var password: String = ""
    @State private var phoneNumber: String = ""
    @State private var passwordCheck: String = ""
    @State private var email: String = ""
    
    // Validation variables
    @State private var isFirstNameValid: Bool = true
    @State private var isLastNameValid: Bool = true
    @State private var isUserIdValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var isPhoneNumberValid: Bool = true
    @State private var isPasswordCheckValid: Bool = true
    @State private var isEmailValid: Bool = true
    
    //Restaurant Sign up
    @State private var name: String = ""
    @State private var RphoneNumber: String = ""
    @State private var websiteUrl: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State private var menuUrl: String = ""
    @State private var slug: String = ""
    
    //Restaurant validation
    @State private var isName: Bool = true
    @State private var isPhone: Bool = true
    @State private var isWebsiteUrl: Bool = true
    @State private var isLatitude: Bool = true
    @State private var isLongitude: Bool = true
    @State private var isMenuUrl: Bool = true
    
    //Choose mode
    
    @State private var isRestaurantSignUp: Bool = false
    @State private var isCustomerSignUp: Bool = false
    
    var body: some View {
        
        ScrollView{
            VStack{
                Text("My Table")
                    .font(.title.bold())
                Text("Sign up")
                    .font(.title3.bold())
                    .padding(.top, 20)
            }
            ZStack{
                if(!isRestaurantSignUp && !isCustomerSignUp){
                    VStack{
                        Button(action:{customerMode()},label:{Text("Create Customer Account")
                                .foregroundColor(Color.black)
                                .frame(width: 350, height: 38)
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color("ColorYellow1"))
                                )
                            
                        }) .padding(EdgeInsets(top: 50, leading: 0, bottom: 15, trailing: 0))
                        
                        Button(action:{restaurantMode()},label:{Text("Create Restaurant Account")
                                .foregroundColor(Color.black)
                                .frame(width: 350, height: 38)
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color("ColorYellow1"))
                                )
                            
                        }) .padding(EdgeInsets(top: 50, leading: 0, bottom: 15, trailing: 0))
                        
                    }
                }
                if(isRestaurantSignUp && !isCustomerSignUp){
                    ScrollView{
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
                            Button(action:{submitted()},label:{Text("Create Account")
                                    .foregroundColor(Color.black)
                                    .frame(width: 350, height: 38)
                                    .background(
                                        RoundedRectangle(cornerRadius: 100)
                                            .fill(Color("ColorYellow1"))
                                    )
                                
                            }) .padding(EdgeInsets(top: 50, leading: 0, bottom: 15, trailing: 0))
                            
                            Button(action:{navigateToLogin()
                            },label:{Text("Log In")
                                    .foregroundColor(Color.black)
                                    .frame(width: 350, height: 38)
                                    .background(
                                        RoundedRectangle(cornerRadius: 100)
                                            .fill(Color("ColorGrey1"))
                                    )
                            })
                            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                        }
                        Spacer()
                    }
                    
                }
                if(!isRestaurantSignUp && isCustomerSignUp){
                    ScrollView{
                        VStack{
                            
                            TextField("First Name", text : $firstName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            
                            
                            if (!isFirstNameValid) {
                                Text("First name is required")
                                    .foregroundColor(Color.red)
                            }
                            
                            TextField("Last Name", text : $lastName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            if (!isLastNameValid) {
                                Text("Last name is required")
                                    .foregroundColor(Color.red)
                            }
                            
                            Group{
                                TextField("Email", text : $email)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                if (!isEmailValid) {
                                    Text("Includes @ in your email")
                                        .foregroundColor(Color.red)
                                }
                                
                                TextField("Phone Number", text : $phoneNumber)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                    .keyboardType(.numberPad)
                                if (!isPhoneNumberValid) {
                                    Text("Phone number must be 10 numbers")
                                        .foregroundColor(Color.red)
                                }
                                
                                TextField("Username", text : $userId)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                if (!isUserIdValid) {
                                    Text("Username must not be less than 6 letters")
                                        .foregroundColor(Color.red)
                                }
                                
                                SecureField("Password", text : $password)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                if (!isPasswordValid) {
                                    Text("Passwords is required")
                                        .foregroundColor(Color.red)
                                }
                                
                                SecureField("Password Check", text : $passwordCheck)
                                    .textFieldStyle(.roundedBorder)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                if (!isPasswordCheckValid) {
                                    Text("Passwords are not matched")
                                        .foregroundColor(Color.red)
                                }
                            }
                            
                            Button(action:{submitted()},label:{Text("Create Account")
                                    .foregroundColor(Color.black)
                                    .frame(width: 350, height: 38)
                                    .background(
                                        RoundedRectangle(cornerRadius: 100)
                                            .fill(Color("ColorYellow1"))
                                    )
                                
                            }) .padding(EdgeInsets(top: 50, leading: 0, bottom: 15, trailing: 0))
                            
                            Button(action:{navigateToLogin()
                            },label:{Text("Log In")
                                    .foregroundColor(Color.black)
                                    .frame(width: 350, height: 38)
                                    .background(
                                        RoundedRectangle(cornerRadius: 100)
                                            .fill(Color("ColorGrey1"))
                                    )
                            })
                            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                }
            }
            
        }
    }
    
    func navigateToLogin() {
        self.isSignup = !isSignup
    }
    
    func submitted() {
        // set all the values for the profile
        // TODO: refactor the below
        isFirstNameValid = isFirstNameValidCheck()
        isLastNameValid = isLastNameValidCheck()
        isUserIdValid = isUserIdValidCheck()
        isPasswordValid = isPasswordValidCheck()
        isPasswordCheckValid = isPasswordCheckValidCheck()
        isPhoneNumberValid = isPhoneNumberValidCheck()
        isEmailValid = isEmailValidCheck()
        if (
            isFirstNameValid ||
            isLastNameValid ||
            isUserIdValid ||
            isPasswordValid ||
            isPasswordCheckValid ||
            isPhoneNumberValid ||
            isEmailValid
        ) {
            self.profileModel.profile.firstName = firstName
            self.profileModel.profile.lastName = lastName
            self.profileModel.profile.username = userId
            self.profileModel.profile.password = password
            self.profileModel.profile.phone = phoneNumber
            self.profileModel.profile.email = email
            self.profileModel.profile.isLoggedIn = true
        }
    }
    
    // TODO: Validation functions
    func isFirstNameValidCheck() -> Bool {
        return firstName.isEmpty ? false : true
    }
    func isLastNameValidCheck() -> Bool {
        return lastName.isEmpty ? false : true
    }
    func isUserIdValidCheck() -> Bool {
        return userId.isEmpty ? false : true
    }
    func isPasswordValidCheck() -> Bool {
        return password.isEmpty ? false : true
    }
    func isPasswordCheckValidCheck() -> Bool {
        return passwordCheck.isEmpty || passwordCheck != password ? false : true
    }
    func isPhoneNumberValidCheck() -> Bool {
        return phoneNumber.isEmpty ? false : true
    }
    func isEmailValidCheck() -> Bool {
        return email.isEmpty ? false : true
    }
    
    func customerMode(){
        
        isRestaurantSignUp = false
        isCustomerSignUp = true
        
    }
    func restaurantMode(){
        isRestaurantSignUp = true
        isCustomerSignUp = false
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isSignup: .constant(true)).environmentObject(LoadProfileData())
    }
}
