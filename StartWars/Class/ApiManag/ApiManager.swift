//
//  ApiManag.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
struct ApiManager {
    static let shared = ApiManager()
    
    func ApiCall<T: Decodable>(for url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(
                .failure(
                    CustomError(description: "Error 1", code: 1)
                )
            )
            return
        }
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }
            if let data {
                do {
                    let object = try JSONDecoder()
                        .decode(T.self,
                                from: data)
                    completion(.success(object))
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
}
