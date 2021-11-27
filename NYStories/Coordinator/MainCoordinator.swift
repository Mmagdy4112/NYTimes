//
//  MainCoordinator.swift
//  Notifire
//
//  Created by Mohamed Magdy on 10/25/21.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var didBackFromSetting : (() -> ()) = {}
    var didBackFromConnected : (() -> ()) = {}
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController.navigationBar.shadowImage = UIImage()
        self.navigationController.navigationBar.isTranslucent = true
    }
    func start() {
        
    }
    func navigateToDetails(item:Items) {
        let viewModel = DetailsViewModel()
        viewModel.item = item
        viewModel.coordinator = self
        let vc = DetailsViewController.instantiate()
        vc.detailsViewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
}
