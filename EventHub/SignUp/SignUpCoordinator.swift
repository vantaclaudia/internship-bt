//
//  SignUpCoordinator.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import UIKit
import SwiftUI

final class SignUpCoordinator {
    let navController: UINavigationController
    var signInCoordinator: SignInCoordinator?
    var homeCoordinator: HomeCoordinator?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let repository = SignUpRepository()
        var navigation = SignUpNavigation()
        
        navigation.onClose = { [weak self] in
            self?.navController.popViewController(animated: true)
            print("Should Close SignUpScreen")
        }
        
        navigation.onGoToSignIn = { [weak self] in
            self?.onGoToSignIn()
        }
        
        navigation.onGoToHome = { [weak self] in
            self?.onGoToHome()
        }
        
        let viewModel = SignUpViewModel(repository: repository, navigation: navigation)
        let view = SignUpView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        navController.navigationBar.isHidden = true
        navController.pushViewController(viewController, animated: true)
    }
    
    func onGoToSignIn() {
        navController.popViewController(animated: true)
    }
    
    func onGoToHome() {
        homeCoordinator = HomeCoordinator(navController: navController)
        homeCoordinator?.start()
    }
}
