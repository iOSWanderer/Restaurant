//
//  Company.swift
//  Company
//
//  Created by Marek Szymanski on 10/09/2021.
//

import Foundation

struct Company: Identifiable {
    var id = UUID()
    var type: DataType
    var data: CompanyData
    
    init(_ data: CompanyData) {
        self.type = .company
        self.data = data
    }
}
