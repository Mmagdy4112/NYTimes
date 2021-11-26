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
//        self.initMenu()
//        let vc = MainViewController.instantiate(storyBoard: "Main")
//        let viewmodel = MainViewModel()
//        viewmodel.coordinator = self
//        vc.mainViewModel = viewmodel
//        SideMenuManager.default.addPanGestureToPresent(toView: vc.view)
//        navigationController.viewControllers = [vc]
    }
    
}
