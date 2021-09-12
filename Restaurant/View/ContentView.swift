//
//  ContentView.swift
//  Restaurant
//
//  Created by Marek Szymanski on 10/09/2021.
//

import SwiftUI

struct ContentView {
    @StateObject private var model = TableViewModel()
    @State private var showAnimation = false
}

extension ContentView: View {
    var body: some View {
        ZStack {
            Color("paper")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Text("La Ristorante")
                        .font(.system(.largeTitle, design: .serif))
                    Text("Our products are just one tap away")
                        .font(.caption2)
                }
                .padding()
                VStack(alignment: .leading) {
                    Text("Our Chefs")
                        .font(.system(.title, design: .serif))
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if model.cooks.isEmpty {
                        Text("No data")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    } else {
                        ScrollView(.vertical) {
                            ForEach(model.cooks, id: \.id) { item in
                                RegularTile(data: item.data)
                                    .padding()
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Our Dishes")
                            .font(.system(.title, design: .serif))
                            .padding(.horizontal)
                        Text("Tap dish to see more")
                            .font(.caption2)
                            .foregroundColor(.red)
                            .opacity(showAnimation ? 0.1 : 1)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {showAnimation.toggle()}
                            }
                        Spacer()
                    }
                    if model.dishes.isEmpty {
                        Text("No data")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    } else {
                        ScrollView(.vertical) {
                            ForEach(model.dishes, id: \.id) { item in
                                DishTile(data: item.data)
                                    .padding()
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Our Drinks")
                        .font(.system(.title, design: .serif))
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if model.drinks.isEmpty {
                        Text("No data")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    } else {
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(model.drinks, id: \.id) { item in
                                    DrinkTile(data: item.data)
                                        .padding()
                                }
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Other places")
                        .font(.system(.title, design: .serif))
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if model.drinks.isEmpty {
                        Text("No data")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    } else {
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(model.companies, id: \.id) { item in
                                    RegularTile(data: item.data)
                                        .padding()
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .onAppear {
            model.getFromServer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
