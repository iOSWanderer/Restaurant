//
//  DrinkTile.swift
//  DrinkTile
//
//  Created by Marek Szymanski on 12/09/2021.
//

import SwiftUI

struct DrinkTile {
    @State var available = false
    var data: Row
}

extension DrinkTile: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .frame(width: 30, height: 30)
                    .offset(x: 30, y: 0)
                ZStack {
                    Rectangle()
                        .frame(width: 50, height: 80)
                    RemoteImage(url: data.image)
                        .frame(width: 50, height: 50, alignment: .center)
                        .scaledToFit()
                }
            }
            Text(data.title)
                .font(.title)
            if available {
                Text("Available")
                    .font(.caption2)
            } else {
                Text("Not available")
                    .font(.caption2)
            }
        }
        .onAppear {
            checkIfCanServe(data.subtitle)
        }
    }
}

extension DrinkTile {
    func checkIfCanServe(_ value: String) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date())
        let hour = components.hour ?? 0
        self.available = value.lowercased() == "available" || (value.lowercased() != "available" && (18...23).contains(hour))
    }
}

struct DrinkTile_Previews: PreviewProvider {
    static var previews: some View {
        DrinkTile(data: DrinkData(name: "A", alcoholic: "true", photo: "img"))
    }
}
