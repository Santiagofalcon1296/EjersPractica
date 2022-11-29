//
//  DetailFilmsInteractor.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
internal final class DetailFilmsInteractor{
    var film: FilmsSW
    private let detailFilmsService: DetailFilmsServiceProtocol
    
    init(film: FilmsSW,detailFilmsService: DetailFilmsServiceProtocol = DetailFilmsService()) {
        self.film = film
        self.detailFilmsService = detailFilmsService
    }
}

extension DetailFilmsInteractor: DetailFilmsInteractorProtocol{
    func getDetailFilmsResult(url: String, completion: @escaping (Result<PeopleSW, Error>) -> Void) {
        let detailFilmsService = self.detailFilmsService.getDetailFilmsService()
        
        detailFilmsService.getDetailFilmsResult(url: url) {result in
            completion(result)
        }

    }
    
    func getDetailFilms() -> FilmsSW {
        return self.film
    }
}
