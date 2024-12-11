//
//  RestaurantListView.swift
//  RestaurantsApp
//
//  Created by El houssaine El GAMOUZ on 8/12/2024.
//

import SwiftUI

struct RestaurantsListView: View {

    @ObservedObject var viewModel: RestaurantsListViewModel
    @ObservedObject var locationManager = LocationManager()
    var body: some View {
        NavigationView {
            Group {
                /*if let coordinate = locationManager.lastKnownLocation {
                 Text("Latitude: \(coordinate.latitude)")
                 Text("Longitude: \(coordinate.longitude)")
                 } else {
                 Text("Unknown Location")
                 }*/
                VStack {
                    TextField("Search Restaurants", text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    List($viewModel.filteredRestaurant, id: \.title) { restaurant in
                        RestaurantListRow(restaurant: restaurant.wrappedValue)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Restaurants List")
            .onAppear {
                locationManager.checkLocationAuthorization()
                viewModel.fetchRestaurants()
            }
        }
    }
}

#Preview {
    RestaurantsListView(viewModel: RestaurantsListViewModel())
}
