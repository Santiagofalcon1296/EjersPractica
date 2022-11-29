//
//  FilmsService.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
internal final class FilmsService: FilmsServiceProtocol{
    private let filmsService: FilmsServiceContract
    
    init(filmsService: FilmsServiceContract = FilmsServiceApi()) {
        self.filmsService = filmsService
    }
    
    func getFilmsService() -> FilmsServiceContract {
        return self.filmsService
    }
}
