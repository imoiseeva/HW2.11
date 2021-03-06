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
                    Post.getNews(from: value)
                    print(value["hits"])
                //должна быть перемен и Post.getNews(from: value)
                    // let newsArray = Post.getNews(from: value)
                   
                case .failure(let error):
                    print(error)
                }
            }
    }
    
   
    
//    func fetchData(from url: String?, with complition: @escaping (Results) -> Void) {
//        guard let stringURL = url else { return }
//        guard let url = URL(string: stringURL) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, _, error) in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            guard let data = data else { return }
//
//            do {
//                let result = try JSONDecoder().decode(Results.self, from: data)
//                DispatchQueue.main.async {
//                    complition(result)
//                }
//            } catch let error {
//                print(error)
//            }
//
//        }.resume()
//    }
    

    
    private init() {}
}
