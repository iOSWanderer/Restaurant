//
//  TableViewModel.swift
//  TableViewModel
//
//  Created by Marek Szymanski on 11/09/2021.
//

import Foundation
import Combine

class TableViewModel: ObservableObject {
    @Published var companies: [Company] = []
    @Published var cooks: [Cook] = []
    @Published var dishes: [Dish] = []
    @Published var drinks: [Drink] = []
    
    private var httpDataRequester: DataRequest = DataRequest()
    private var cancellable: AnyCancellable?
    
    func getFromServer() {
        httpDataRequester = DataRequest()
        httpDataRequester.getAllDataFromServer()
        self.cancellable = httpDataRequester.$data
            .dropFirst()
            .receive(on: RunLoop.main)
            .sink {[weak self] items in
            for item in items {
                guard let type = DataType.init(rawValue: item.type), let self = self else {
                    return
                }
                switch type {
                case .company:
                    self.companies.append(Company(CompanyData(name: item.data.name|, address: item.data.address|, logo: item.data.logo|)))
                case .cook:
                    self.cooks.append(Cook(CookData(name: item.data.name|, occupation: item.data.occupation|, picture: item.data.picture|)))
                case .dish:
                    self.dishes.append(Dish(DishData(name: item.data.name|, ingredients: item.data.ingredients|, thumbnail: item.data.thumbnail|)))
                case .drink:
                    self.drinks.append(Drink(DrinkData(name: item.data.name|, alcoholic: item.data.alcoholic|, photo: item.data.photo|)))
                }
            }
        }
    }
    
}

postfix operator |
postfix func |(value: String?) -> String {
    return value ?? "Unknown"
}
