//
//  HotelListView.swift
//  Thambi (iOS)
//
//  Created by Vicky on 21/08/22.
//

import SwiftUI

struct HotelListView: View {
    let data = ["Behruz Briyani","Amutha Surabhi","Slaves","Hotel Gowri Krishna"]
        
    var body: some View {
        List(data, id: \.self) { name in
            Section(header: Text("All restaurants near you")) {
                ForEach(1..<8) { _ in
                    ZStack {
                        HotelListViewCell(hotelName: name,foodImage: "briyaniPot", isVeg: false, distance: "2 Km", timeTaken: "10 mins", offerPercentage: "20%", cusineType: "South Indian", price: "₹250", rating: "4.5")
                            .padding(.bottom,16)
                        NavigationLink(destination: FoodItemListView()) {
                            EmptyView()
                        }
                        .frame(width:0).opacity(0)
                    }
                }
            }
            .listRowSeparator(.hidden)
        }
          .listStyle(PlainListStyle())
        //.navigationTitle("All restuarants near you")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListView()
    }
}
