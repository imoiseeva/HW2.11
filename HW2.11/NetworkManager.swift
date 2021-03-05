//
//  NetworkManager.swift
//  HW2.11
//
//  Created by Irina Moiseeva on 04.03.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
   // private var post = [Post]()
    
    func fetchData(from url: String?, with complition: @escaping (Results) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Results.self, from: data)
                DispatchQueue.main.async {
                    complition(result)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
//    func fetchData() {
//
//        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            if let response = response {
//                print(response)
//            }
//
//            let decoder = JSONDecoder()
//            if let safeData = data {
//                do {
//                    let results = try decoder.decode(Results.self, from: safeData)
//                    DispatchQueue.main.async {
//                        self.post = results.hits
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//
//        }
//
//    }
    
    private init() {}
}
