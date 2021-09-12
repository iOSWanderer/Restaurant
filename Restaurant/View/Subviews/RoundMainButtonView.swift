//
//  RoundMainButtonView.swift
//  RoundMainButtonView
//
//  Created by Marek Szymanski on 12/09/2021.
//

import SwiftUI

struct RoundMainButtonView {
    var data: Row
    @Binding var hideText: Bool
    var showFullDescription = false
}

extension RoundMainButtonView: View {
    var body: some View {
        ZStack {
            VStack {
                RemoteImage(url: data.image)
                    .frame(width: 80, height: 80, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color("wood"), lineWidth: 2)
                    )
                    .zIndex(1)
                HStack {
                    Text(data.title)
                        .fontWeight(.medium)
                    if showFullDescription {
                        Text(data.subtitle)
                            .fontWeight(.medium)
                    }
                }
                .font(.caption2)
                .foregroundColor(.black)
                .rotationEffect(.degrees(hideText ? 90 : 0))
                .offset(x: 0, y: hideText ? -40 : 0)
                .opacity(hideText ?  0 : 1)
                
            }
        }
    }
}
