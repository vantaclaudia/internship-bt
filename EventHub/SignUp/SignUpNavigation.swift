//
//  SignUpNavigation.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import Foundation

protocol SignUpNavigationProtocol {
    var onClose: (() -> Void)? { get set}
    var onGoToSignUp: (() -> Void)? { get set}
}

struct SignUpNavigation: SignUpNavigationProtocol {
    var onClose: (() -> Void)?
    var onGoToSignUp: (() -> Void)?
}
