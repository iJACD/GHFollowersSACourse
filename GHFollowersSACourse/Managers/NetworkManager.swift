//
//  NetworkManager.swift
//  GHFollowersSACourse
//
//  Created by JohnAnthony on 1/29/20.
//  Copyright © 2020 iJACD. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion: @escaping ([Follower]?, String?) -> ()) {
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completion(nil, "This username created an invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, resp, err in
            if let _ = err {
                completion(nil, "Unable to complete your request. Please check your internet connection")
                return
            }
            
            guard let response = resp as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Invalid response from the server. Please try again.")
                return
            }
            
            guard let data = data else {
                completion(nil, "The data recieved from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(followers, nil)
            } catch {
                completion(nil, "The data recieved from the server was invalid. Please try again.")
            }
        }
        
        task.resume()
    }
}
