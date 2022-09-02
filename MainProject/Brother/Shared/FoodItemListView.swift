//
//  FoodItemListView.swift
//  Thambi (iOS)
//
//  Created by Vicky on 21/08/22.
//

import SwiftUI

struct FoodItemListView: View {
    // let data = ["Noodles","fish","mutton"]
    
    @State private var quantitySelected: UInt = 0
    // @Binding var showBottomSheet: Bool
    @ObservedObject var viewModel = FoodListViewModel()
    @State private var checkoutFoodItems:[Food] = []
    
    init() {
        viewModel = FoodListViewModel()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            hotelDetailsView
            List {
                Section(header: Text("Recommended")) {
                    ForEach(viewModel.foodAray,id: \.name) { foodItem in
                        FoodItemListViewCell(foodName: foodItem.name, price: "₹\(foodItem.price)", isAvailable: foodItem.isAvailable, isVeg: foodItem.isVeg, foodImage: foodItem.image) { quantity in
                            addToCheckoutArray(foodItem: foodItem, quantity: quantity)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(PlainListStyle())
            //.listStyle(SidebarListStyle())
            .navigationTitle("Hotel Gowri Krishna")
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .toolbar {
            bottomToolBar
        }
        .onAppear {
            viewModel.fetchFoodList()
        }
    }
    
    var totalPrice: UInt {
        checkoutFoodItems.compactMap({UInt($0.totalPrice)}).reduce(0, +)
    }
    
    var bottomToolBar: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            Text("Items \(checkoutFoodItems.count)")
                .font(.system(size: 12, weight: .semibold, design: .rounded))
            Spacer()
            Text("Amount: \(totalPrice)")
                .font(.system(size: 12, weight: .semibold, design: .rounded))
            Spacer()
            NavigationLink(destination: CheckoutView()) {
//                Button {
//                    //onCheckout()
//                } label: {
                    Text("Checkout")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(Color.gray)
                //}
            }.navigationTitle(Text("Checkout"))
        }
    }
    
    var hotelDetailsView: some View {
        VStack(alignment:.leading) {
            Text("South Indian, Chinese, North Indian")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding(.top,2)
            Text("Pollachi - 3 km")
                .font(.system(size: 14, weight: .regular, design: .rounded))
        }
        .padding([.leading])
    }
    
    func addToCheckoutArray(foodItem: Food, quantity: UInt) {
        
        if !checkoutFoodItems.contains(foodItem) {
            var newFoodItem = Food(name: foodItem.name,
                                   price: foodItem.price,
                                   isVeg: foodItem.isVeg,
                                   isAvailable: foodItem.isAvailable,
                                   image: foodItem.image,
                                   id: foodItem.id)
            newFoodItem.totalPrice = Int(foodItem.price)!
            checkoutFoodItems.append(newFoodItem)
        } else {
            for (index,item) in checkoutFoodItems.enumerated() {
                if item == foodItem {
                    var newFoodItem = Food(name: foodItem.name,
                                           price: foodItem.price,
                                           isVeg: foodItem.isVeg,
                                           isAvailable: foodItem.isAvailable,
                                           image: foodItem.image,
                                           id: foodItem.id)
                    newFoodItem.quantity = quantity
                    newFoodItem.totalPrice = Int(quantity * UInt(foodItem.price)!)
                    checkoutFoodItems[index] = newFoodItem
                }
            }
        }
    }
    
    
    func onCheckout() {
        NavigationLink(destination: CheckoutView()) {
            EmptyView()
        }
    }
}

struct FoodItemListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemListView()
    }
}
