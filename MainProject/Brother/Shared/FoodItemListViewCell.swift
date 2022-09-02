//
//  FoodItemListViewCell.swift
//  Thambi (iOS)
//
//  Created by Vicky on 21/08/22.
//

import SwiftUI

struct FoodItemListViewCell: View {
    var foodName: String
    var price: String
    var isAvailable: Bool
    var isVeg: Bool
    var foodImage: String
    var onQuantityChange: (UInt) -> ()
    
    @State private var quantity: UInt = 0
    private(set) var minValue = UInt.min
    private(set) var maxValue = 15
    
    var body: some View {
        itemDetails
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray, radius: 4, x: 2, y: 2)
    }
    
    var itemDetails: some View {
            HStack(alignment: .top) {
                Image(foodImage)
                    .resizable()
                    .cornerRadius(12)
                    .frame(width: 160, height: 120, alignment: .center)
                  
                VStack(alignment:.trailing) {
                    itemTextDetails
                    Spacer()
                    Stepper(quantityToDisplay) {
                        guard quantity < maxValue else { return }
                        quantity += 1
                        onQuantityChange(quantity)
                    } onDecrement: {
                        guard quantity > minValue else { return }
                        quantity -= 1
                        onQuantityChange(quantity)
                    }
                }
            }
            .background(Color.clear)
            .padding(8)
    }
    
    var quantityToDisplay: String {
        quantity > 0 ? "Quantity: \(quantity)" : ""
    }
    
    var itemTextDetails: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(foodName)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .padding(6)
                Text(price)
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .padding(6)
              
            }
            Spacer()
            Image(systemName: "circle.square")
                .background(isVeg == true ? .green : .red)
                .border(isVeg == true ? .green : .red)
                .foregroundColor(.white)
                .padding(6)
        }.background(Color.clear)
    }
}

struct FoodItemListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemListViewCell(foodName: "Mutton Briyani", price: "250", isAvailable: true, isVeg: false, foodImage: "dosa", onQuantityChange: {_ in })
    }
}
