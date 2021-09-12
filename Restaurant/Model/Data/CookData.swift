//
//  Cook.swift
//  Cook
//
//  Created by Marek Szymanski on 10/09/2021.
//

import Foundation

struct CookData: Row {
    private(set) var title: String
    private(set) var subtitle: String
    private(set) var image: String
    
    var name: String
    var occupation: String
    var picture: String
    
    init(name: String, occupation: String, picture: String) {
        self.name = name
        self.occupation = occupation
        self.picture = picture
        
        let temp = name.split(separator: " ").map { String($0) }
        
        title = temp.first ?? "Unknown"
        subtitle = temp.dropFirst().joined(separator: " ")
        image = picture
    }
}
