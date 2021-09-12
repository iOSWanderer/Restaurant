//
//  Dish.swift
//  Dish
//
//  Created by Marek Szymanski on 10/09/2021.
//

import Foundation

struct DishData: Row {
    private(set) var title: String
    private(set) var subtitle: String
    private(set) var image: String
    
    var name: String
    var ingredients: String
    var thumbnail: String
    
    init(name: String, ingredients: String, thumbnail: String) {
        self.name = name
        self.ingredients = ingredients
        self.thumbnail = thumbnail
        
        title = name
        subtitle = ingredients
        image = thumbnail
    }
}
