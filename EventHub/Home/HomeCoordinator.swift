//
//  HomeCoordinator.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import UIKit
import SwiftUI

final class HomeCoordinator {
    let navController: UINavigationController

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start() {
        let repository = HomeRepository()
        var navigation = HomeNavigation()
 
        navigation.onClose = { [weak self] in
            self?.navController.popViewController(animated: true)
            print("Should Close SignUpScreen")
        }

        let viewModel = HomeViewModel(repository: repository, navigation: navigation)
        let view = HomeView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        navController.pushViewController(viewController, animated: true)
    }
}

