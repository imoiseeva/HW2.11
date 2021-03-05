//
//  NetworkManager.swift
//  HW2.11
//
//  Created by Irina Moiseeva on 04.03.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private var post = [Post]()
    
    func fetchData() {
        
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            let decoder = JSONDecoder()
            if let safeData = data {
                do {
                    let results = try decoder.decode(Results.self, from: safeData)
                    DispatchQueue.main.async {
                        self.post = results.hits
                    }
                } catch {
                    print(error)
                }
            }
            
        }
        
    }
    
    private init() {}
}
