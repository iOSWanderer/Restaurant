//
//  Drink.swift
//  Drink
//
//  Created by Marek Szymanski on 10/09/2021.
//

import Foundation

struct DrinkData: Row {
    private(set) var title: String
    private(set) var subtitle: String
    private(set) var image: String
    
    var name: String
    var alcoholic: String
    var photo: String
    
    private enum CodingKeys : String, CodingKey { case name, alcoholic, photo }
    
    init(name: String, alcoholic: String, photo: String) {
        self.name = name
        self.alcoholic = alcoholic
        self.photo = photo
        
        title = name
        subtitle = alcoholic.lowercased() == "true" ? "Not available" : "Available"
        image = photo
    }
}
