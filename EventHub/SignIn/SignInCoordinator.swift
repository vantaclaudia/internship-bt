//
//  SignInCoordinator.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import UIKit
import SwiftUI

final class SignInCoordinator {
    let navController: UINavigationController

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start() {
        let repository = SignInRepository()
        var navigation = SignInNavigation()

        navigation.onClose = { [weak self] in
            self?.navController.popViewController(animated: true)
            print("Should Close SignInScreen")
        }

        let viewModel = SignInViewModel(repository: repository, navigation: navigation)
        let view = SignInView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        navController.pushViewController(viewController, animated: true)
    }
}
