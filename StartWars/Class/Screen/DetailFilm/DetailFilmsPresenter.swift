//
//  DetailFilmsPresenter.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
internal final class DetailFilmsPresenter{
    
    var view: DetailFilmsViewProtocol?
    var interactor: DetailFilmsInteractorProtocol
    var film = [String]()
    var charact = [PeopleSW]()
    
    init( interactor: DetailFilmsInteractorProtocol) {
        self.interactor = interactor
    }
}

extension DetailFilmsPresenter: DetailFilmsPresenterProtocol{
    func getDetailFilms() {
        self.film = interactor.getDetailFilms().characters
        
        for character in film{
            interactor.getDetailFilmsResult(url: character){ result in
                switch result {
                case.failure(let error):
                    self.view?.showError?(message: error.localizedDescription)
                case.success(let charact):
                    self.charact.append(charact)
                    self.view?.loadDetailFilms()
                }}
        }
        
    }
    
    func getDetailFilmsCount() -> Int {
        return self.charact.count
    }
    
    func deatilFilmsAtIndex(index: Int) -> PeopleSW {
        return self.charact[index]
    }
    
}
