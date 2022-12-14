//
//  CreateEventNavigation.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import Foundation

protocol CreateEventNavigationProtocol {
    var onGoToHome: (() -> Void)? { get set}
}

struct CreateEventNavigation: CreateEventNavigationProtocol {
    var onGoToHome: (() -> Void)?
}
