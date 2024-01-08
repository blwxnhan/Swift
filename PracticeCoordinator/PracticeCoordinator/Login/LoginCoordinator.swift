//
//  LoginCoordinator.swift
//  PracticeCoordinator
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

class LoginCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    var delegate : LoginCoordinatorDelegate?
    
    private var navigationController : UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .brown
        viewController.delegate = self
        
        self.navigationController.viewControllers = [viewController]
    }
}

extension LoginCoordinator : LoginViewControllerDelegate {
    func login() {
        self.delegate?.didLoggedIn(self)
    }
}
