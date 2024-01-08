//
//  CoordinatorProtocol.swift
//  PracticeCoordinator
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit

protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}

class AppCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    private var navigationController : UINavigationController!
    
    var isLoggedIn : Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if self.isLoggedIn {
            self.showMainViewController()
        }
        else {
            self.showLoginViewController()
        }
    }
    
    private func showMainViewController() {
        let coordinator = MainCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        
        self.childCoordinators.append(coordinator)
    }
    
    private func showLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        
        self.childCoordinators.append(coordinator)
    }
    
    private func showDetailViewController() {
        let coordinator = DetailCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        
        self.childCoordinators.append(coordinator)
    }
    
}

// MARK: - delegate Extension
extension AppCoordinator : LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showMainViewController()
    }
}

extension AppCoordinator : MainCoordinatorDelegate {
    func didLoggedOut(_ coordinator: MainCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showLoginViewController()
    }
    
    func didPresentDetail(_ coordinator: MainCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showDetailViewController()
    }
}

extension AppCoordinator : DetailCoordinatorDelegate {
    func didPresentMain(_ coordinator: DetailCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showMainViewController()
    }
}
