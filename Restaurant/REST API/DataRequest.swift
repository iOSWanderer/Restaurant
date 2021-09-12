//
//  DataRequest.swift
//  DataRequest
//
//  Created by Marek Szymanski on 10/09/2021.
//

import Foundation
import Combine

class DataRequest {
    let url = URL(string: "https://run.mocky.io/v3/a50cdf42-aef1-4a33-9536-98c8337338bf")
    @Published var data: [GenericObject] = []
    @Published var error: String?
    
    func getAllDataFromServer() {
        guard let url = url else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {
                     if let decodedData = try? JSONDecoder().decode(JSONData.self, from: data) {
                         self.error = decodedData.error
                         self.data = []
                         self.data = decodedData.data
                     }
                 }
              } else if let error = error {
                  self.error = error.localizedDescription
              }
           }.resume()
    }
    
}
