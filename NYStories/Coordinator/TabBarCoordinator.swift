//
//  TabBarCoordinator.swift
//  NYStories
//
//  Created by Mohamed Magdy on 11/26/21.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController.navigationBar.shadowImage = UIImage()
        self.navigationController.navigationBar.isTranslucent = true
    }

    func start() {
        let baseTabBar = BaseTabBar.instantiate()
        navigationController.viewControllers = [baseTabBar]
        baseTabBar.viewControllers = [mainViewController() ,bookMarksViewController() ]
    }
    
    func mainViewController()->MainViewController{
        let mainVc = MainViewController.instantiate()
        let viewmodel = MainViewModel()
        viewmodel.coordinator = MainCoordinator(navigationController: navigationController)
        mainVc.mainViewModel = viewmodel
        return mainVc
    }
    func bookMarksViewController()->BookMarksViewController{
        let bookVc = BookMarksViewController.instantiate()
        let viewmodel = BookMarksViewModel()
        viewmodel.coordinator = MainCoordinator(navigationController: navigationController)
        bookVc.bookMarksViewModel = viewmodel
        return bookVc
    }
}
