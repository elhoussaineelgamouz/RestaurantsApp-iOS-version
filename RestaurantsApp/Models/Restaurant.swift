//
//  Restaurant.swift
//  RestaurantsApp
//
//  Created by El houssaine El GAMOUZ on 8/12/2024.
//

import Foundation

struct Restaurant: Decodable, Hashable {
    var title: String
    var image: String
    var description: String
    var geolocation: Geolocation
}
