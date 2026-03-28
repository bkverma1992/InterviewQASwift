//
//  NetworkManager.swift
//  UnitTestingProject
//
//  Created by APPLE on 27/12/25.
//


protocol NetworkProtocol {
    func loginApi(completion: @escaping (Result <User, Error>) -> Void)
}

import Foundation

class NetworkService: NetworkProtocol {
    func loginApi(completion: @escaping (Result<User, Error>) -> Void) {
        let url = URL(string: "https://dummyjson.com/users/1")
        let urlReuest = URLRequest(url: url!)
        URLSession.shared.dataTask(with: urlReuest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {
                return
            }
            do {
                let userData = try JSONDecoder().decode(User.self, from: data)
                completion(.success(userData))
            } catch {
                completion(.failure(error))
            }
            
        }
        .resume()
    }
    
    
}
