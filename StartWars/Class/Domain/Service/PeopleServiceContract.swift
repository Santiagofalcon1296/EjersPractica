//
//  PeopleServiceContract.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
protocol DetailFilmsServiceContract {
    func getDetailFilmsResult(url: String,completion: @escaping (Result<PeopleSW, Error>) -> Void)
}

