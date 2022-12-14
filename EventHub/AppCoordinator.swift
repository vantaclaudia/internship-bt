//
//  AppCoordinator.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import UIKit

final class AppCoordinator {
    let window: UIWindow
    let navController: UINavigationController
    var signInCoordinator: SignInCoordinator?

    init(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        self.navController = UINavigationController()
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }

    func start() {
        let isLogged = false

        if isLogged {
//            print("show dashobard")
        } else {
            signInCoordinator = SignInCoordinator(navController: navController)
            signInCoordinator?.start()
        }
    }
}
