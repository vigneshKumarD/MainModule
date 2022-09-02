//
//  HotelListViewCell.swift
//  Thambi (iOS)
//
//  Created by Vicky on 21/08/22.
//

import SwiftUI

struct HotelListViewCell: View {
    var hotelName: String
    var foodImage: String
    var isVeg: Bool
    var distance: String
    var timeTaken: String
    var offerPercentage: String
    var cusineType: String
    var price: String
    var rating: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 8) {
                imageView
                    .frame(width: geometry.size.width)
                HStack {
                    VStack(alignment: .leading){
                        Text(hotelName)
                            .font(.system(size: 18, weight: .bold, design: .default))
                        Text(cusineType)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                    }
                    .padding([.leading,.bottom],6)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(rating)
                            .font(.system(size: 14, weight: .medium, design: .default))
                        Text(price)
                            .font(.system(size: 14, weight: .medium, design: .default))
                    }
                    .padding([.trailing,.bottom],6)
                }
            }
            .background(Color.yellow)
        }
        .frame(height: 240)
        .cornerRadius(12)
        .shadow(color: .gray, radius: 4, x: 2, y: 2)
    }
    
    var imageView:  some View {
        ZStack {
            Image(foodImage)
                .resizable()
            imageViewTextItems
        }
        .cornerRadius(12)
    }
    
    var imageViewTextItems: some View {
        VStack {
            Text(isVeg == true ? "Pure Vegeterian" : "Non Vegeterian")
                .font(.system(size: 16, weight: .medium, design: .default))
                .padding(4)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.white.opacity(0.8))
            Spacer()
            HStack {
                Text(offerPercentage)
                    .font(.system(size: 14, weight: .medium, design: .default))
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 4, trailing: 0))
                Spacer()
                Text(distance + " | " + timeTaken)
                    .font(.system(size: 14, weight: .medium, design: .default))
                    .background(Color.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 4))
            }
        }
    }
}

struct HotelListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        HotelListViewCell(hotelName: "Hotel name", foodImage: "dosa", isVeg: false, distance: "10km", timeTaken: "23 mins", offerPercentage:"10%", cusineType: "south", price: "230", rating: "2.1").frame(width: 320, height: 210, alignment: .center)
    }
}
