//
//  Model.swift
//  HW2.11
//
//  Created by Irina Moiseeva on 04.03.2021.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
    
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID ?? ""
    }
    let objectID: String?
    let points: Int?
    let title: String?
    let url: String?
    
    init(newsData: [String: Any]) {
        objectID = newsData["title"] as? String
        points = newsData["points"] as? Int
        title = newsData["title"] as? String
        url = newsData["url"] as? String
    }
    
    static func getNews(from value: Any) -> [Post] {
        guard let newData = value as? [String: [String: Any]] else { return [] }

        var news: [Post] = []
        for new in newData["hits"] {
            let newItems = Post(newsData: new)
            news.append(newItems)

        }

        return news

       // return newData.compactMap { Post(newsData: $0)}
    }
    
}

enum URLS: String {
    case api = "https://hn.algolia.com/api/v1/search?tags=front_page"
}


//init(newsData: [String: Any]) {
//    objectID = newsData["title"] as? String
//    points = newsData["points"] as? Int
//    title = newsData["title"] as? String
//    url = newsData["url"] as? String
//}
//
//static func getNews(from value: Any) -> [Post] {
//    guard let newData = value as? [[String: Any]] else { return [] }
//    return newData.compactMap { Post(newsData: $0)}
//}
