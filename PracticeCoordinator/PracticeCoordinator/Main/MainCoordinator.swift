//
//  MainCoordinator.swift
//  PracticeCoordinator
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit

protocol MainCoordinatorDelegate {
    func didLoggedOut(_ coordinator: MainCoordinator)
    func didPresentDetail(_ coordinator: MainCoordinator)
}

class MainCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var delegate : MainCoordinatorDelegate?
    
    private var navigationController : UINavigationController!
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.view.backgroundColor = .cyan
        viewController.delegate = self
        
        self.navigationController.viewControllers = [viewController]
    }
}

extension MainCoordinator : MainViewControllerDelegate {
    func logout() {
        self.delegate?.didLoggedOut(self)
    }
    
    func detailPresent() {
        self.delegate?.didPresentDetail(self)
    }
}
