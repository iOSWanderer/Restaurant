//
//  CustomOperators.swift
//  CustomOperators
//
//  Created by Marek Szymanski on 12/09/2021.
//

import Foundation

postfix operator |
postfix func |(value: String?) -> String {
    return value ?? "Unknown"
}
