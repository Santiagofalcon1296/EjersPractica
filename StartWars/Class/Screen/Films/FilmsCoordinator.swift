//
//  FilmsCoordinator.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
import UIKit

class FilmsCoordinator: FilmsCoordinatorDelegate {
    
    func goToDetailScreen(film: FilmsSW ,sender: UIViewController) {
        // Change Home -> Detail
        
        //Cambiar a detail
        let interactor = DetailFilmsInteractor(film: film)
        let presenter = DetailFilmsPresenter(interactor: interactor)
        let view = DetailFilmsViewController(presenter: presenter)
        
        presenter.view = view
        
        sender.navigationController?.show(view, sender: nil)
    }
}
