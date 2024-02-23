//
//  AuthenticationModule.swift
//  MyTable
//
//  Created by Pascal Couturier on 21/8/2023.
//

import Foundation
import SwiftUI

struct AuthenticationModule: View {
    // Authentication modules
    @State private var isSignup = false
    @Binding var modeCheck: Bool
    var body: some View {
        NavigationView {
            // Conditionally show the signup or login views when placed on the page
            if (isSignup) {
                SignUpView(isSignup: $isSignup)
            } else {
                LoginView(isSignup: $isSignup,modeCheck:$modeCheck)
            }
        }
    }
}
