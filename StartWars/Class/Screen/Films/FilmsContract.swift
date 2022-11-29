//
//  FilmsContract.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
import UIKit

protocol FilmsViewProtocol: BaseProtocol {
    func loadFilms()
}

protocol FilmsPresenterProtocol{
    var  view: FilmsViewProtocol? {get set}
    
    func getFilms()
    
    func getFilmsCount()-> Int
    func filmsAtIndex(index: Int) -> FilmsSW
}

protocol FilmsInteractorProtocol {
    func getFilmsResult(completion: @escaping (Result<[FilmsSW], Error>) -> Void)
}

protocol FilmsServiceProtocol {
    func getFilmsService() -> FilmsServiceContract
}

protocol FilmsCoordinatorDelegate {
    func goToDetailScreen(film: FilmsSW, sender: UIViewController)
}
