//
//  ContentView.swift
//  Shared
//
//  Created by Vicky on 21/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu: Bool = false
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
       return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    IntermediateView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if showMenu {
                        MenuListView()
                            .frame(width: geometry.size.width,height: geometry.size.height)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            withAnimation {
                                showMenu.toggle()
                            }
                        } label: {
                            Image(systemName: showMenu ? "arrow.backward" : "line.horizontal.3")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
