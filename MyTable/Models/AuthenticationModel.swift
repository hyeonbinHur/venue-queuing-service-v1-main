//
//  ProfileViewModel.swift
//  MyTable
//
//  Created by Pascal Couturier on 21/8/2023.
//

import Foundation

// This will contain the login model for authentication specifically when connecting to an
// external resource for authentication
class AuthenticationModel: ObservableObject {
    @Published var isSignup = false
}
