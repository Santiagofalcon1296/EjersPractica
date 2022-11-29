//
//  Coordinator.swift
//  StartWars
//
//  Created by Santiago Falcon on 27/11/22.
//

import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
