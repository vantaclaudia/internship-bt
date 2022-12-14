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
    var homeCoordinator: HomeCoordinator?

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start() {
        let repository = CreateEventRepository()
        var navigation = CreateEventNavigation()

        navigation.onGoToHome = { [weak self] in
            self?.onGoToHome()
        }

        let viewModel = CreateEventViewModel(repository: repository, navigation: navigation)
        let view = CreateEventView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        navController.navigationBar.isHidden = true
        navController.pushViewController(viewController, animated: true)
    }
    
    func onGoToHome() {
        homeCoordinator = HomeCoordinator(navController: navController)
        homeCoordinator?.start()
    }
}
