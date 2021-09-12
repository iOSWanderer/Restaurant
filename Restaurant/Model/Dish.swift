//
//  Dish.swift
//  Dish
//
//  Created by Marek Szymanski on 11/09/2021.
//

import Foundation

struct Dish: Identifiable {
    var id = UUID()
    var type: DataType
    var data: DishData
    
    init(_ data: DishData) {
        self.type = .dish
        self.data = data
    }
}
