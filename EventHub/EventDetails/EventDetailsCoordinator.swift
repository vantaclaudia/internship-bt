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

    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start() {
        let repository = EventDetailsRepository()
        var navigation = EventDetailsNavigation()

        let viewModel = EventDetailsViewModel(repository: repository, navigation: navigation)
        let view = EventDetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        navController.navigationBar.isHidden = true
        navController.pushViewController(viewController, animated: true)
    }
}
