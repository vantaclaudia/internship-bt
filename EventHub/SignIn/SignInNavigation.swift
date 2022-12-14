//
//  SignInNavigation.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import Foundation

protocol SignInNavigationProtocol {
    var onGoToSignUp: (() -> Void)? { get set}
    var onGoToSignIn: (() -> Void)? { get set}
    var onGoToHome: (() -> Void)? { get set}
}

struct SignInNavigation: SignInNavigationProtocol {
    var onGoToSignUp: (() -> Void)?
    var onGoToSignIn: (() -> Void)?
    var onGoToHome: (() -> Void)?
}
