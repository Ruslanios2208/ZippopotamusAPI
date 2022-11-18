//
//  NetworkManager.swift
//  ZippopotamusAPI
//
//  Created by Руслан Шигапов on 09.11.2022.
//

import Foundation
import Alamofire

enum Link: String {
    case url = "https://api.zippopotam.us/tr/07460"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchZip(from url: String, completion: @escaping (Result<Zip, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let zip = Zip.getZip(from: value)
                    completion(.success(zip))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
