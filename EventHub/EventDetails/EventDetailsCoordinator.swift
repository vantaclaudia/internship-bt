//
//  EventDetailsCoordinator.swift
//  EventHub
//
//  Created by Claudia Vanta on 08.12.2022.
//

import Foundation
import SwiftUI

final class EventDetailsCoordinator {
    let navController: UINavigationController
    var homeCoordinator: HomeCoordinator?

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start(_ id: String) {
        let repository = EventDetailsRepository()
        var navigation = EventDetailsNavigation()
        
        navigation.onGoToHome = { [weak self] in
            self?.onGoToHome()
        }

        let viewModel = EventDetailsViewModel(repository: repository, navigation: navigation, id: id)
        let view = EventDetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        navController.navigationBar.isHidden = true
        navController.pushViewController(viewController, animated: true)
    }
    
    func onGoToHome() {
        homeCoordinator = HomeCoordinator(navController: navController)
        homeCoordinator?.start()
    }
}
