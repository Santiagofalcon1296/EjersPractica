//
//  FilmsServiceApi.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
public class FilmsServiceApi: FilmsServiceContract{
    func getFilmsResult(completion: @escaping (Result<[FilmsSW], Error>) -> Void) {
        guard let url = URL(string: CallsConstants.filmsUrl) else {
            // completion(.failure(errorObject)
            return
        }
        //Si falla a la red
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url) { (data, response, error) in
                if let error {
                    if let filmsSaved = StoreManager.shared.getFilms(){
                        completion(.success(filmsSaved))
                    } else {
                        completion(.failure(error))
                    }
                    return
                }
                if let data {
                    do {
                        let filmsApiResult = try JSONDecoder().decode(FilmsResponseApi.self,
                                                                      from: data)
                        completion(.success(filmsApiResult.results))
                        StoreManager.shared.saveInfo(films: filmsApiResult.results)
//                        let x = StoreManager.shared.getCachesDirectory()
//                        print(x)
                    } catch let decodeError {
                        //Si falla algo de Json o Api
                        if let filmsSaved = StoreManager.shared.getFilms(){
                            completion(.success(filmsSaved))
                        } else {
                            completion(.failure(decodeError))}
                    }
                }
            }.resume()
    }
}
