//
//  RestaurantAPIService.swift
//  RestaurantsApp
//
//  Created by El houssaine El GAMOUZ on 8/12/2024.
//

import Foundation
import Combine

class RestaurantAPIService {
    func fetchRestaurants(from url: String) -> AnyPublisher<[Restaurant], Error> {

        let restaurants = [Restaurant(title: "The Gourmet Bistro", image: "GourmetBistro", description: "A cozy spot offering international gourmet dishes.", geolocation: Geolocation(latitude: -26.204103, longitude: 28.047305)), Restaurant(title: "La Pizzeria", image: "LaPizzeria", description: "Authentic Italian pizza with wood-fired crusts.", geolocation: Geolocation(latitude: -26.203103, longitude: 28.046306)), Restaurant(title: "Pizza Express", image: "PizzaExpress", description: "Quick and delicious pizza for all tastes.",geolocation: Geolocation(latitude: -26.202103, longitude: 28.045306)),Restaurant(title: "Tapas Lounge", image: "TapasLounge", description: "Spanish tapas with a vibrant atmosphere.",geolocation: Geolocation(latitude: -26.202104, longitude: 28.045307)),Restaurant(title: "Dim Sum Palace", image: "DimSumPalace", description: "Authentic Chinese dim sum and dumplings.",geolocation: Geolocation(latitude: -26.201104, longitude: 28.044307)),Restaurant(title: "Mediterraneo", image: "Mediterraneo", description: "Mediterranean dishes with a focus on healthy ingredients.",geolocation: Geolocation(latitude: -26.200104, longitude: 28.043307)),Restaurant(title: "Curry House", image: "CurryHouse", description: "Spicy and savory Indian curries.",geolocation: Geolocation(latitude: -26.200105, longitude: 28.043308)),Restaurant(title: "Steakhouse Prime",image: "SteakhousePrime",description: "Premium steaks cooked to perfection.", geolocation: Geolocation(latitude: -26.204104, longitude: 28.047306)),Restaurant(title: "Mediterraneo", image: "Mediterraneo", description: "Mediterranean dishes with a focus on healthy ingredients.",geolocation: Geolocation(latitude: -26.304104, longitude: 28.143308)),Restaurant(title: "Cafe Parisien", image: "CafeParisien", description: "French cafe with pastries and artisanal coffee.",geolocation: Geolocation(latitude: -26.204114, longitude: 28.143318))]

        return Just(restaurants)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
