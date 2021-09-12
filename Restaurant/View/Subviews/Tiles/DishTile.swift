//
//  CookTile.swift
//  CookTile
//
//  Created by Marek Szymanski on 11/09/2021.
//

import SwiftUI

struct DishTile {
    var data: Row
    @Namespace private var animation
    @State private var showDetails = false
}

extension DishTile: View {
    
    var body: some View {
        HStack {
            ZStack(alignment: .top) {
                WoodBoardView(showDetails: $showDetails, data: data)
                    .offset(x: showDetails ? 80 : 0)
                RoundMainButtonView(data: data, hideText: $showDetails)
                    .onTapGesture {
                        withAnimation(Animation.easeIn) {
                            showDetails.toggle()
                        }
                    }
            }
            Spacer()
        }
        .frame(width: showDetails ? 250 : 100)
    }
}

fileprivate struct WoodBoardView: View {
    @Binding var showDetails: Bool
    var data: Row
    var body: some View {
        ZStack {
            Image("woodBG")
                .resizable()
                .cornerRadius(showDetails ? 20 : 90)
                
            HStack {
                Spacer()
                ScrollView(showsIndicators: false) {
                    let temp = data.subtitle.split(separator: ",").map {
                        String($0).trimmingCharacters(in: CharacterSet(charactersIn: " "))
                    }
                    ForEach(temp, id: \.self) { item in
                        Text(item)
                            .font(.title)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .foregroundColor(.white)
                            .scaleEffect(showDetails ? 1 : 0)
                            .padding(.horizontal, 20)
                    }
                }
                .padding(.horizontal, 4)
                Spacer()
            }
            .padding(.leading, 20)
        }
        .frame(width: showDetails ? 160 : 80, height: 80)
    }
}
