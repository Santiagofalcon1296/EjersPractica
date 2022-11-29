//
//  PeoplesServiceApi.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
public class PeopleServiceApi: DetailFilmsServiceContract{
    func getDetailFilmsResult(url: String, completion: @escaping (Result<PeopleSW, Error>) -> Void) {
        ApiManager.shared.ApiCall(for: url) { (result: Result<PeopleApi, Error>) in
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case.success(let character):
                completion(.success(character))
            }
        }
    }
}
