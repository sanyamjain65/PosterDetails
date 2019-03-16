//
//  APIClient.swift
//  PosterDetails
//
//  Created by Sanyam Jain on 16/03/19.
//  Copyright © 2019 Sanyam Jain. All rights reserved.
//

import Foundation

typealias PosterJson = [String: Any]

struct APIClient {
    static func getPosterDetails(page: Int,completion: @escaping(PosterJson?) -> Void) {
        print("page is \(page)")
        let components = URLComponents(string: "http://www.omdbapi.com/?s=Batman&page=\(page)&apikey=eeefc96f")!
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                print("error in getting data")
                return
            }
            guard let data = data else {
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any] {
                    print("response of request is  \(String(describing: json["Search"]))")
                    completion(json)
                }
            } catch  {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        })
        task.resume()
    }
}
