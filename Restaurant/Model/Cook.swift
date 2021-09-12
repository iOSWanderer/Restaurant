//
//  Cook.swift
//  Cook
//
//  Created by Marek Szymanski on 11/09/2021.
//

import Foundation

struct Cook: Identifiable {
    var id = UUID()
    var type: DataType
    var data: CookData
    
    init(_ data: CookData) {
        self.type = .cook
        self.data = data
    }
}
