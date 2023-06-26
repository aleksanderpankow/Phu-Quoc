//
//  Network.swift
//  PhuQuoc
//
//  Created by Aleksander Pankow on 28/05/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager: ObservableObject {
    public var results: [Category] = []
//    func fetchCategories() -> [Category]{
//
//        let url = "http://phuquoc.local/wp-json/cththemes/v1/listings/categories"
//
////        AF.request(url).responseDecodable(of: Category.self) { response in
////            switch response.result {
////            case .success:
////                guard let data = response.data else { return }
////                if response.data != nil {
////
////                    print(data)
////                    completion((data as? Category)!)
////
////                }
////            case .failure(let error):
////                print("Error: \(error.localizedDescription)")
////            }
////        }
//        AF.request(url).responseDecodable(of: [Category].self) { response in
//            switch response.result{
//            case .success:
//                guard let categories = response.value else {
//                    return
//                }
//                self.results.append(contentsOf: categories)
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//        return results
//    }
}
