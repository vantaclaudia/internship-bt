//
//  SignUpCoordinator.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import UIKit
import SwiftUI

final class SignupCoordinator {
    let navController: UINavigationController

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start() {
        let repository = SignUpRepository()
        var navigation = SignUpNavigation()
//        var signUpNavigation = SignInNavigation()

//        signUpNavigation.goToSignUp = { [weak self] in
//            self?.navController.popViewController(animated: true)
//            print("Should Close SignUpScreen")
//        }
        
        navigation.onClose = { [weak self] in
            self?.navController.popViewController(animated: true)
            print("Should Close SignUpScreen")
        }

        let viewModel = SignUpViewModel(repository: repository, navigation: navigation)
        let view = SignUpView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        navController.pushViewController(viewController, animated: true)
    }
}
