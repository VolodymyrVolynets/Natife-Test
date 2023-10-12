//
//  NetworkManager.swift
//  Natife-Test-UIKit
//
//  Created by Vova on 12/10/2023.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getRequest<T: Codable>(stringURL: String, completion: @escaping (Result<T, Error>) -> Void    ) {
        guard let url = URL(string: stringURL) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                do {
                    let myData = try decoder.decode(T.self, from: data)
                    completion(.success(myData))
                } catch {
                    completion(.failure(error))
                }
            }

            task.resume()
    }
}
