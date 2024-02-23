//
//  Restaurant.swift
//  MyTable
//
//  Created by Pascal Couturier on 20/8/2023.
//

import Foundation

// Restaurant model for all restaurant mapping
struct RestaurantModel: Codable, Identifiable{
    
    enum CodingKeys: CodingKey {
        case venueId
        case name
        case slug
        case cuisine
        case image
        case distance
        case rating
        case phone
        case websiteUrl
        case menuUrl
        case featuredImages
        case latitude
        case longitude
        case numOfQueue
        case inQueue
    }
    
    var id = UUID()
    var venueId: String
    var name: String
    var slug: String
    var cuisine: String
    var image: String
    var distance: Double
    var rating: Double
    var phone: String
    var websiteUrl: String
    var menuUrl: String
    var featuredImages: [String]
    var latitude : Double
    var longitude : Double
    var numOfQueue : Int
    var inQueue : [String]
}

// Load restaurant data
class LoadRestaurantData: ObservableObject {
    @Published var restaurants = [RestaurantModel]()
    
    // load on instantiation
    init() {
        loadRestaurants()
    }
    
    // TODO: This currently load dummy data from a json file
    func loadRestaurants() {
        guard let url = Bundle.main.url(forResource: "RestaurantData", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        let data = try? Data(contentsOf: url)
        let restaurants = try? JSONDecoder().decode([RestaurantModel].self, from: data!)
        self.restaurants = restaurants!
    }
}
