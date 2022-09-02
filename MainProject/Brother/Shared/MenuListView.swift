//
//  MenuListView.swift
//  Thambi (iOS)
//
//  Created by Vicky on 24/08/22.
//

import SwiftUI

struct MenuData: Equatable {
    var title: String
    var icon: String
    var id = UUID()
    
}


let one = MenuData(title: "Notifications", icon: "bell")
let two = MenuData(title: "My Orders", icon: "doc.plaintext")
let three = MenuData(title: "Support", icon: "phone")
let four = MenuData(title: "Send feedback", icon: "square.and.pencil")
let five = MenuData(title: "Rate us on app store", icon: "star.leadinghalf.filled")
let signOut = MenuData(title: "Log out", icon: "power")
let aboutUs = MenuData(title: "About us", icon: "info.circle")

let menuOptions: [MenuData] = [one,two,three,four,five,aboutUs]
let viewScenes = [MyOrdersView](repeatElement(MyOrdersView(), count: menuOptions.count))

struct MenuListView: View {
    
    var body: some View {
        List {
            Section {
                ForEach(Array(menuOptions.enumerated()) ,id: \.offset) { index, item in
                    menuRow(index: index, item: item)
                        .padding()
                }
            }
            Section {
                cellRow
            } footer: {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Version: 1.0.32")
                        .font(.system(size: 12, weight: .medium, design: .default))
                        .foregroundColor(Color.gray.opacity(0.4))
                    Spacer()
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
    
    var cellRow: some View {
        Section {
            HStack {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .padding(.trailing,12)
                Text("Log out")
                    .font(.system(size: 16, weight: .medium, design: .default))
            }
            .padding()
        }
        .listStyle(PlainListStyle())
    }
    
    func menuRow(index: Int, item: MenuData) -> some View {
        ZStack {
            HStack {
                Image(systemName: item.icon)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .padding(.trailing,12)
                Text(item.title)
                    .font(.system(size: 16, weight: .medium, design: .default))
            }
            NavigationLink(destination: viewScenes[index]) {
                EmptyView()
            }.buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
