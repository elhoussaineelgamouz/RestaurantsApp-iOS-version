//
//  RestaurantsListViewModel.swift
//  RestaurantsApp
//
//  Created by El houssaine El GAMOUZ on 8/12/2024.
//

import Foundation
import Combine

class RestaurantsListViewModel: ObservableObject {

    @Published var searchText: String = ""
    @Published var restaurants: [Restaurant] = []
    @Published var filteredRestaurant: [Restaurant] = []
    @Published var isLoading = false
    @Published var isSearching = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private var restaurantAPIService = RestaurantAPIService()

    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .map { searchText in
                searchText.lowercased()
            }
            .combineLatest($restaurants)
            .map { (searchText, restaurants) in
                restaurants.filter { restaurant in
                    searchText.isEmpty ||
                    restaurant.title.lowercased().contains(searchText) ||
                    restaurant.description.lowercased().contains(searchText)
                }
            }
            .assign(to: &$filteredRestaurant)
    }

    func fetchRestaurants() {
        isLoading = true
        restaurantAPIService.fetchRestaurants(from: Endpoint.baseUrl)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] restaurants in
                self?.restaurants = restaurants
            })
            .store(in: &cancellables)
    }

}
