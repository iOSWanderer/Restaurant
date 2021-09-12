//
//  Drink.swift
//  Drink
//
//  Created by Marek Szymanski on 11/09/2021.
//

import Foundation

struct Drink: Identifiable {
    var id = UUID()
    var type: DataType
    var data: DrinkData
    
    init(_ data: DrinkData) {
        self.type = .drink
        self.data = data
    }
}
