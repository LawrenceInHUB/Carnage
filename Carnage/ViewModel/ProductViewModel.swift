//
//  ProductViewModel.swift
//  Carnage
//
//  Created by Raveen Perera on 2024-03-30.
//

import Foundation
import Alamofire

class ProductViewModel: ObservableObject {
    @Published var clothingItems = [ProductModel]()

    func fetchData() {
        AF.request("http://localhost:8070/data").responseDecodable(of: [ProductModel].self) { response in
            switch response.result {
            case .success(let data):
                self.clothingItems = data
                print("Data fro API " , self.clothingItems )
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
