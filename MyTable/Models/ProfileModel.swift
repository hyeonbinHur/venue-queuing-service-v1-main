//
//  ProfileModel.swift
//  MyTable
//
//  Created by Pascal Couturier on 21/8/2023.
//

import Foundation

struct ProfileModel: Codable, Identifiable {
    
    enum CodingKeys: CodingKey {
        case userId
        case firstName
        case lastName
        case password
        case username
        case email
        case phone
        case avatarUrl
        case isVenue
    }
    
    var id = UUID()
    var userId: String
    var firstName: String
    var lastName: String
    var password: String
    var username: String
    var email: String
    var phone: String
    var avatarUrl: String
    var isVenue: Bool
    var isLoggedIn: Bool = false
}

// Loads the profile data for the logged in user
class LoadProfileData: ObservableObject {
    @Published var profile = ProfileModel(userId: "", firstName: "", lastName: "", password: "", username: "", email: "", phone: "", avatarUrl: "", isVenue: false, isLoggedIn: false)
    
    // TODO: This currently load dummy data from a json file
    func loadProfileData() {
        guard let url = Bundle.main.url(forResource: "ProfileData", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        let data = try? Data(contentsOf: url)
        let profile = try? JSONDecoder().decode(ProfileModel.self, from: data!)
        self.profile = profile!
    }
    
    // TODO: This will all be a single call when api's are connected and it will return with a single response
    func loadVenueProfileData() {
        guard let url = Bundle.main.url(forResource: "VenueProfileData", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        let data = try? Data(contentsOf: url)
        let profile = try? JSONDecoder().decode(ProfileModel.self, from: data!)
        self.profile = profile!
    }
    
    // Clears profile data when a user logs out of the application
    func clearProfileData() {
        self.profile = ProfileModel(
            userId: "", firstName: "", lastName: "", password: "", username: "", email: "", phone: "", avatarUrl: "", isVenue: false, isLoggedIn: false
        )
    }
}
