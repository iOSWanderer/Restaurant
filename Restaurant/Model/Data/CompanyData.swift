//
//  Company.swift
//  Company
//
//  Created by Marek Szymanski on 10/09/2021.
//

import Foundation

struct CompanyData: Row {
    private(set) var title: String
    private(set) var subtitle: String
    private(set) var image: String
    
    var name: String
    var address: String
    var logo: String
    
    init(name: String, address: String, logo: String) {
        self.name = name
        self.address = address
        self.logo = logo
        
        title = name
        subtitle = address
        image = logo
    }
}
