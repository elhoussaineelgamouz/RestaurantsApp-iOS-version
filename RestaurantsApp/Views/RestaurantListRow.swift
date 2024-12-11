//
//  RestaurantListRow.swift
//  RestaurantsApp
//
//  Created by El houssaine El GAMOUZ on 8/12/2024.
//

import SwiftUI

struct RestaurantListRow: View {
    let restaurant: Restaurant
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Restaurant Image
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 2)
            
            // Title and Description
            VStack(alignment: .leading, spacing: 4) {
                Text(restaurant.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(restaurant.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    RestaurantListRow(restaurant: Restaurant(title: "", image: "", description: "", geolocation: Geolocation(latitude: 0.0, longitude: 0.0)))
}
