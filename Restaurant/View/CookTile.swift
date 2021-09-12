//
//  CookTile.swift
//  CookTile
//
//  Created by Marek Szymanski on 12/09/2021.
//

import SwiftUI

struct RegularTile: View {
    var data: Row
    var body: some View {
        RoundMainButtonView(data: data, hideText: .constant(false), showFullDescription: true)
    }
}
