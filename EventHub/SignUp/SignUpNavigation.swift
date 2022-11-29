//
//  SignUpNavigation.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import Foundation

protocol SignUpNavigationProtocol {
    var onClose: (() -> Void)? { get set}
    var onGoToSignIn: (() -> Void)? { get set}
    var onGoToHome: (() -> Void)? { get set}
}

struct SignUpNavigation: SignUpNavigationProtocol {
    var onClose: (() -> Void)?
    var onGoToSignIn: (() -> Void)?
    var onGoToHome: (() -> Void)?
}
