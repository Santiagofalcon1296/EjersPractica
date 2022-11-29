//
//  DetailFilmsService.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation

internal final class DetailFilmsService: DetailFilmsServiceProtocol{
    private let detailFilmsService: DetailFilmsServiceContract
    
    init(detailFilmsService: DetailFilmsServiceContract = PeopleServiceApi()) {
        self.detailFilmsService = detailFilmsService
    }
    
    func getDetailFilmsService() -> DetailFilmsServiceContract {
        return self.detailFilmsService
    }
}
