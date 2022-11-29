//
//  DetailFilmsContract.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
import Foundation
import UIKit

protocol DetailFilmsViewProtocol: BaseProtocol {
    func loadDetailFilms()
}

protocol DetailFilmsPresenterProtocol{
    var  view: DetailFilmsViewProtocol? {get set}
    
    func getDetailFilms()
    
    func getDetailFilmsCount()-> Int
    func deatilFilmsAtIndex(index: Int) -> PeopleSW
}

protocol DetailFilmsInteractorProtocol {
    
    func getDetailFilms() -> FilmsSW
    func getDetailFilmsResult(url: String, completion: @escaping (Result<PeopleSW, Error>) -> Void)

}

protocol DetailFilmsServiceProtocol {
    func getDetailFilmsService() -> DetailFilmsServiceContract

}


protocol DetailFilmsCoordinatorDelegate {
    func goToDetailScreen(planets: FilmsSW, sender: UIViewController)
}
