//
//  NetworkManager.swift
//  HW2.11
//
//  Created by Irina Moiseeva on 04.03.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(from url: String?, with complition: @escaping (Results) -> Void) {
        AF.request(URLS.api.rawValue)
            .validate()
            .responseJSON { responseDate in
                switch responseDate.result {
                case .success(let value):
                    guard let value = value as? [String: Any], let hits = value["hits"] as? [[String: Any]] else { complition(Results(hits: []))
                        return }
                    
                    let news = Post.getNews(from: hits)
                    let results = Results(hits: news)
                    
                    complition(results)
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private init() {}
}
