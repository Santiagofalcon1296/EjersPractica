//
//  FilmsServiceContract.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
protocol FilmsServiceContract {
    func getFilmsResult(completion: @escaping (Result<[FilmsSW], Error>) -> Void)
}
