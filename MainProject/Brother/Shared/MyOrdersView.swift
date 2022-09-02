//
//  MyOrdersView.swift
//  Thambi (iOS)
//
//  Created by Vicky on 27/08/22.
//

import SwiftUI

let foodItems = ["Lollipop [4 pieces]","Chicken briyani","Mushroom Briyani","Noodles"]
struct MyOrdersView: View {
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        List {
            ForEach(0..<4) { _ in
                orderCellView
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
        }
    }
    
    var orderCellView: some View {
        VStack(alignment: .leading,spacing: 8) {
            hotelDetails
            foodItemView
            foodItemView
            foodItemView
            dateView
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray, radius: 4, x: 2, y: 2)
    }
    
    var hotelDetails: some View {
        HStack(alignment: .top) {
            VStack(alignment:.leading) {
                Text("Slaves Restaurant")
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                Text("Pollachi")
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundColor(.black.opacity(0.5))
            }
            Spacer()
            Text("Delivered")
                .padding(2)
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(.gray)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(2)
        }
        .padding([.leading,.trailing,.top],6)
        .padding(.bottom,8)
        .background(Color.gray.opacity(0.1))
    }
    
    var foodItemView: some View {
        HStack {
            Image(systemName: "circle.square.fill")
                .foregroundColor(Color.red)
            Text("1 ×")
                .font(.system(size: 14, weight: .semibold, design: .default))
                .foregroundColor(.black.opacity(0.5))
            Text("Mutton Pepper Fry")
                .font(.system(size: 14, weight: .semibold, design: .default))
                .foregroundColor(.black)
        }
        .padding([.leading,.trailing],8)
    }
    
    var dateView: some View {
        VStack {
            Divider()
                .padding(6)
            HStack {
                Text("06 Apr 2022 at 1:22 pm")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(Color.gray.opacity(0.5))
                Spacer()
                Text("222".inCurrency)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                Image(systemName: "chevron.right")
                    .padding(6)
            }
            .padding([.leading,.trailing,.bottom],8)
        }
    }
}

struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView()
    }
}
