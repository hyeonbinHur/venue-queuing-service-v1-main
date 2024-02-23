//
//  loginPage.swift
//  my_table
//
//  Created by snlcom on 2023/08/12.
//

import SwiftUI

struct LoginView: View {
    
    // Set check for if login or signup page
    @Binding var isSignup: Bool
    
    // Binding for profile
    @EnvironmentObject var profileModel: LoadProfileData
    
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var hasValidationError = false
    
    @State private var isCustomer: Bool = false
    @State private var isRestaurant: Bool = false
    @State private var isLogedin: Bool = false
    
    // TODO: remove the below as it's only for testing
    @State private var showingAlert = false
    
    //
    @Binding var modeCheck:Bool
    
    var body: some View {
        
        ZStack{
            LogoCustomLayoutModule()
            VStack{
                
                Text("Welcome back!")
                    .font(.largeTitle.bold())
                    .padding(.top, 40)
                Text("We're glad to see you again")
                
                VStack {
                    Text("Login Details")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                        .padding(.leading, 20)
                    
                    TextField("Email" , text:$email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    SecureField("Password" , text:$password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    
                    if (hasValidationError) {
                        Text("Invalid email or password")
                            .font(.callout)
                            .foregroundColor(Color.red)
                            .padding(.top, -10)
                    }
                    
                    Button("Forgot password?"){ showingAlert = true}
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                    // TODO: remove the below, heere for testing
                        .alert("Username: john@smith.com  password: 1234", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) {}
                        }
                    HStack{
                        Button(action:{CustomerSubmitted()},label:{Text("Customer Sign in")
                                .foregroundColor(Color.black)
                                .frame(width: 170, height: 38)
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color("ColorYellow1"))
                                )
                            
                        }) .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        
                        Button(action:{RestaurantSubmitted()},label:{Text("Restaurant Sign in")
                                .foregroundColor(Color.black)
                                .frame(width: 170, height: 38)
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color("ColorYellow1"))
                                )
                            
                        }) .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                    }
                    Button(action:{navigateToSignup()
                    },label:{Text("Sign up")
                            .foregroundColor(Color.black)
                            .frame(width: 350, height: 38)
                            .background(
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(Color("ColorGrey1"))
                            )
                        
                    })
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                    
                    // TODO: remove after testing
                                        Group {
                                            Text("*Below are for testing only and will be removed ")
                                                .font(.headline)
                                                .padding(.top, 40)
                                            Button(action:{loginAsCustomer()},label:{Text("Tester: Sign in as customer")
                                                    .foregroundColor(Color.black)
                                                    .frame(width: 350, height: 38)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 100)
                                                            .fill(Color("ColorYellow1"))
                                                    )
                    
                                            }) .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                            Button(action:{loginAsVenue()},label:{Text("Tester: Sign in as venue")
                                                    .foregroundColor(Color.black)
                                                    .frame(width: 350, height: 38)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 100)
                                                            .fill(Color("ColorYellow1"))
                                                    )
                    
                                            }) .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                        }
                }
                .padding(.top, 100)
                Spacer()
            }
            
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
        
    }
    
    func navigateToSignup() {
        self.isSignup = true
    }
    
    func CustomerSubmitted() {
        // TODO: fix dummy submission login to real login
        // Also having 2 versions for a venue and non venue is only for dummy code reasons
        self.hasValidationError = false
        
        // check if venue or customer
        if (self.email.lowercased() == "restaurant") {
            self.profileModel.loadVenueProfileData()
        } else {
            self.profileModel.loadProfileData()
        }
        
        // check if fields are valid and empty user data if invalid and show error
        if ((email.isEmpty || email.lowercased() != profileModel.profile.email) || (password.isEmpty || password != profileModel.profile.password)) {
            self.profileModel.clearProfileData()
            self.hasValidationError = true
            isCustomer = true;
            isRestaurant = false;
        } else {
            self.profileModel.profile.isLoggedIn = true
            modeCheck = true
        }
    }
    
    func RestaurantSubmitted() {
        // TODO: fix dummy submission login to real login
        // Also having 2 versions for a venue and non venue is only for dummy code reasons
        self.hasValidationError = false
        
        // check if venue or customer
        if (self.email.lowercased() == "restaurant") {
            self.profileModel.loadVenueProfileData()
        } else {
            self.profileModel.loadProfileData()
            
        }
        
        // check if fields are valid and empty user data if invalid and show error
        if ((email.isEmpty || email.lowercased() != profileModel.profile.email) || (password.isEmpty || password != profileModel.profile.password)) {
            self.profileModel.clearProfileData()
            self.hasValidationError = true
            isCustomer = false;
            isRestaurant = true;
        } else {
            self.profileModel.profile.isLoggedIn = true
            modeCheck = false
            
        }
    }
    // TODO: remove after, for testing purposes only
        func loginAsCustomer() {
            self.profileModel.loadProfileData()
            self.profileModel.profile.isLoggedIn = true
        }
        func loginAsVenue() {
            self.profileModel.loadVenueProfileData()
            self.profileModel.profile.isLoggedIn = true
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isSignup: .constant(true),modeCheck: .constant(true)).environmentObject(LoadProfileData())
    }
}
