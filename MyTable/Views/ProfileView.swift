//
//  ProfileView.swift
//  MyTable
//
//  Created by Pascal Couturier on 21/8/2023.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    // Binding for profile
    @EnvironmentObject var profileModel: LoadProfileData
    
    @State private var isLoggedIn:Bool = false
    @State private var isCustomer:Bool = false
    @State private var isRestaurant:Bool = false
    @State private var isSignUp:Bool = false
    
    @Binding var modeCheck: Bool
    
    var body: some View {
        VStack{
            if(modeCheck){
                CustomerProfileView()
                    .background(Color.black)
            }else{
                RestaurantProfileView()
                    .background(Color.black)
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(modeCheck:.constant(true)).environmentObject(LoadProfileData())
    }
}

