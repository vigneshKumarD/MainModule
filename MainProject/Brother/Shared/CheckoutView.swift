//
//  CheckoutView.swift
//  Thambi (iOS)
//
//  Created by Vicky on 25/08/22.
//

import SwiftUI

struct CheckoutView: View {
    var body: some View {
        List {
            ForEach(0..<1) { indices in
                Section {
                    Text("Your orders")
                        .font(.system(size: 20, weight: .bold, design: .default))
                }
                Section(header: Text("Food Items")) {
                    ForEach(0..<2) { _ in
                        Text("Pongal")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                        Text("150".inCurrency)
                            .font(.system(size: 14, weight: .semibold, design: .default))
                    }
                }
            }
            Section {
                showOrderTotalAndDetails(textDescription: "Item total", textValue: "131.00", weight: .semibold, size: 16)
                showOrderTotalAndDetails(textDescription: "Delivery charges", textValue: "23.00", weight: .medium, size: 16)
                showOrderTotalAndDetails(textDescription: "Govt. charges", textValue: "16.55", weight: .medium, size: 16)
                showOrderTotalAndDetails(textDescription: "Grand total", textValue: "160.55", weight: .bold, size: 18)
            }
            
            Section {
                NavigationLink(destination: Text("Done")) {
                    Text("Payment")
                        .frame(width: 320, height: 45, alignment: .center)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    func showOrderTotalAndDetails(textDescription: String, textValue: String, weight: Font.Weight, size: CGFloat) -> some View {
        HStack {
            Text(textDescription)
                .font(.system(size: size, weight: weight, design: .default))
            Spacer()
            Text(textValue.inCurrency)
                .font(.system(size: size, weight: weight, design: .default))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
