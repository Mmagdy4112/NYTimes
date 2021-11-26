//
//  Coordinator.swift
//  Notifire
//
//  Created by Mohamed Magdy on 10/25/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
