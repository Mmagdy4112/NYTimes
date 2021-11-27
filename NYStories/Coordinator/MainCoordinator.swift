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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(identifier: "TabBarController")
        let mainVc = MainViewController.instantiate()
        let viewmodel = MainViewModel()
        viewmodel.coordinator = self
        mainVc.mainViewModel = viewmodel
        
//        let mainVc = MainViewController.instantiate()
//        let viewmodel = MainViewModel()
//        viewmodel.coordinator = self
//        vc.mainViewModel = viewmodel
        
        navigationController.viewControllers = [tabBarController]
        
        

    }
    
}
