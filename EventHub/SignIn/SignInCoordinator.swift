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
    var signUpCoordinator: SignUpCoordinator?
    var homeCoordinator: HomeCoordinator?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let repository = SignInRepository()
        var navigation = SignInNavigation()
        
        navigation.onGoToSignUp = { [weak self] in
            self?.onGoToSignUp()
        }
        
        navigation.onGoToHome = { [weak self] in
            self?.onGoToHome()
        }
        
        let viewModel = SignInViewModel(repository: repository, navigation: navigation)
        let view = SignInView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        navController.navigationBar.isHidden = true
        navController.pushViewController(viewController, animated: true)
    }
    
    func onGoToSignUp() {
        signUpCoordinator = SignUpCoordinator(navController: navController)
        signUpCoordinator?.start()
    }
    
    func onGoToHome() {
        homeCoordinator = HomeCoordinator(navController: navController)
        homeCoordinator?.start()
    }
}
