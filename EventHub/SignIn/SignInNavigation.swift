//
//  SignInNavigation.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import Foundation

protocol SignInNavigationProtocol {
    var onClose: (() -> Void)? { get set}
    var onGoToSignUp: (() -> Void)? { get set}
    var onGoToSignIn: (() -> Void)? { get set}
}

struct SignInNavigation: SignInNavigationProtocol {
    var onClose: (() -> Void)?
    var onGoToSignUp: (() -> Void)?
    var onGoToSignIn: (() -> Void)?
}
