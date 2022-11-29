//
//  FilmsInteractor.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
internal final class FilmsInteractor {
    private let filmsService: FilmsServiceProtocol
    
    init(filmsService: FilmsServiceProtocol = FilmsService()) {
        self.filmsService = filmsService
    }
}

extension FilmsInteractor: FilmsInteractorProtocol{
    func getFilmsResult(completion: @escaping (Result<[FilmsSW], Error>) -> Void) {
        
        let filmsService = self.filmsService.getFilmsService()
        
        filmsService.getFilmsResult {result in
            completion(result)
        }
    }
    
    
}
