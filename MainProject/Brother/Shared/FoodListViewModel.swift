//
//  FoodListViewModel.swift
//  Thambi (iOS)
//
//  Created by Vicky on 24/08/22.
//

import Foundation


struct FoodListModal: Codable {
    let food: [Food]
}

// MARK: - Food
struct Food: Codable, Identifiable, Equatable {
    var name, price: String
    let isVeg, isAvailable: Bool
    let image: String
    var id: Int
    var quantity: UInt = 0
    var totalPrice: Int = 0
    
    private enum CodingKeys : String, CodingKey {
            case name, price, isVeg, image, isAvailable, id
    }
    
    static func ==(lhs: Food, rhs: Food) -> Bool {
        lhs.id == rhs.id
    }
}

struct CheckoutFoodItems {
    var price: Double
    var totalPrice: Int
    var quantity: UInt = 1
    var food: Food
    var id: UUID
}


class FoodListViewModel: ObservableObject {
    
    @Published var foodAray = [Food]()
    
    func fetchFoodList() {
        if let url = Bundle.main.url(forResource: "foodList", withExtension: "json") {
              do {
                  let data = try Data(contentsOf: url)
                  let decoder = JSONDecoder()
                  let ndn = try decoder.decode(FoodListModal.self, from: data)
                  print(ndn)
                  foodAray = ndn.food
              } catch {
                  print("error:\(error)")
              }
        }
//        if let path = Bundle.main.path(forResource: "foodList", ofType: "json") {
//            do {
//                let data = try Data(c)
//                let decoder = JSONDecoder()
//                foodAray = try decoder.decode(ResponseData.self, from: data)
//              } catch {
//                   // handle error
//              }
//        }
    }
    
}
