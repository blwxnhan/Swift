//
//  DetailCoordinator.swift
//  PracticeCoordinator
//
//  Created by Bowon Han on 1/7/24.
//

import UIKit

protocol DetailCoordinatorDelegate {
    func didPresentMain(_ coordinator: DetailCoordinator)
}

class DetailCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    var delegate : DetailCoordinatorDelegate?
    
    private var navigationController : UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = DetailViewController()
        viewController.view.backgroundColor = .gray
        viewController.delegate = self
        
        self.navigationController.viewControllers = [viewController]
    }
}

extension DetailCoordinator : DetailViewControllerDelegate {
    func backMain(){
        self.delegate?.didPresentMain(self)
    }
}
