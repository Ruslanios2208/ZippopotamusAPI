//
//  NetworkManager.swift
//  ZippopotamusAPI
//
//  Created by Руслан Шигапов on 09.11.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

enum Link: String {
    case url = "https://api.zippopotam.us/tr/07460"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchZip(from url: String, completion: @escaping (Result<Zip, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let zip = try JSONDecoder().decode(Zip.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(zip))
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
