//
//  CreateEventCoordinator.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import UIKit
import SwiftUI

final class CreateEventCoordinator {
    let navController: UINavigationController

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start() {
        let repository = CreateEventRepository()
        var navigation = CreateEventNavigation()
 
        navigation.onClose = { [weak self] in
            self?.navController.popViewController(animated: true)
            print("Should Close SignUpScreen")
        }

        let viewModel = CreateEventViewModel(repository: repository, navigation: navigation)
        let view = CreateEventView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        navController.pushViewController(viewController, animated: true)
    }
}
