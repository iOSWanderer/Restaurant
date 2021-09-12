//
//  JSONData.swift
//  JSONData
//
//  Created by Marek Szymanski on 11/09/2021.
//

import Foundation

struct JSONData: Codable {
    var data: [GenericObject]
    var error: String?
}
