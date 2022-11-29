//
//  FilmsPresenter.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
internal final class FilmsPresenter: FilmsPresenterProtocol{
   
    var view: FilmsViewProtocol?
    var interactor: FilmsInteractorProtocol
    var films = [FilmsSW]()
    
    init( interactor: FilmsInteractorProtocol) {
        self.interactor = interactor
    }
    
    func getFilms() {
        interactor.getFilmsResult{
            result in
            switch result{
            case.failure(let error):
                self.view?.showError?(message: error.localizedDescription)
            case.success(let film):
                self.films.append(contentsOf: film)
                self.view?.loadFilms()
            }
        }
    }
    
    func getFilmsCount() -> Int {
        return films.count
    }
    
    func filmsAtIndex(index: Int) -> FilmsSW {
        return self.films[index]
    }
}
