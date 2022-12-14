//
//  ProfileCoordinator.swift
//  EventHub
//
//  Created by Claudia Vanta on 09.12.2022.
//

import UIKit
import SwiftUI

final class ProfileCoordinator {
    let navController: UINavigationController

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start() {
        let repository = ProfileRepository()
        let navigation = ProfileNavigation()

        let viewModel = ProfileViewModel(repository: repository, navigation: navigation)
        let view = ProfileView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        navController.navigationBar.isHidden = true
        navController.pushViewController(viewController, animated: true)
    }
}
