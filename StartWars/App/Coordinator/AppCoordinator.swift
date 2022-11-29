//
//  AppCoordinator.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import Foundation
import Foundation
import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var window: UIWindow
    
    lazy var navigationController: UINavigationController = {
        getNavigation()
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    private func getNavigation() -> UINavigationController {
        let navigator = UINavigationController()
        
        return navigator
    }
    
  
    func start() {
        showHome()
    }
    
    func showHome() {
        let coordinator = FilmsCoordinator()
        let interactor = FilmsInteractor()
        let presenter = FilmsPresenter(interactor: interactor)
        let view = FilmsViewController(presenter: presenter)
        
        view.delegate = coordinator
        presenter.view = view
        
        navigationController.setViewControllers([view], animated: true)
    }
}
