//
//  EditProfile.swift
//  MyTable
//
//  Created by snlcom on 2023/08/23.
//

import SwiftUI

struct EditProfile: View {
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
    @State private var isValid: Bool = false
    
    @State private var isShowing: Bool = false
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
                
                HStack{
                    VStack(alignment: .leading,spacing: 5){
                        Text("First Name")
                            .padding(.leading,25)
                        TextField(profileModel.profile.firstName, text : $firstName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        
                        
                        if (!isFirstNameValid) {
                            Text("First name is required")
                                .foregroundColor(Color.red)
                        }
                        
                    }
                    VStack(alignment: .leading,spacing: 5){
                        Text("Last Name")
                            .padding(.leading,25)
                        TextField(profileModel.profile.lastName, text : $lastName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        if (!isLastNameValid) {
                            Text("Last name is required")
                                .foregroundColor(Color.red)
                        }
                    }
                }
                
                VStack(spacing: 15){
                    VStack(alignment: .leading,spacing: 5){
                        Text("Email")
                            .padding(.leading,25)
                        TextField(profileModel.profile.email, text : $email)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        if (!isEmailValid) {
                            Text("Includes @ in your email")
                                .foregroundColor(Color.red)
                        }
                    }
                    VStack(alignment: .leading,spacing: 5){
                        Text("Phone number")
                            .padding(.leading,25)
                        TextField(profileModel.profile.phone, text : $phoneNumber)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .keyboardType(.numberPad)
                        if (!isPhoneNumberValid) {
                            Text("Phone number must be 10 numbers")
                                .foregroundColor(Color.red)
                        }
                    }
                    VStack(alignment: .leading,spacing: 5){
                        Text("Username")
                            .padding(.leading,25)
                        TextField(profileModel.profile.username, text : $userId)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        if (!isUserIdValid) {
                            Text("Username must not be less than 6 letters")
                                .foregroundColor(Color.red)
                        }
                    }
                    VStack(alignment: .leading,spacing: 5){
                        Text("Password")
                            .padding(.leading,25)
                        
                        SecureField(profileModel.profile.password, text : $password)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        if (!isPasswordValid) {
                            Text("Passwords is required")
                                .foregroundColor(Color.red)
                        }
                    }
                    VStack(alignment: .leading,spacing: 5){
                        Text("Password Check")
                            .padding(.leading,25)
                        
                        SecureField("", text : $passwordCheck)
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                        if (!isPasswordCheckValid) {
                            Text("Passwords are not matched")
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
            }
 
    }
    
    // *Todo Validation check -> edit Profile*
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
            isValid = true;
            print("Edit Valid")
            self.profileModel.profile.firstName = firstName
            self.profileModel.profile.lastName = lastName
            self.profileModel.profile.username = userId
            self.profileModel.profile.password = password
            self.profileModel.profile.phone = phoneNumber
            self.profileModel.profile.email = email
            self.profileModel.profile.isLoggedIn = true
            isEditing = false
        }
    }
    
    
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

}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile(isEditing:.constant(true)).environmentObject(LoadProfileData())
    }
}
