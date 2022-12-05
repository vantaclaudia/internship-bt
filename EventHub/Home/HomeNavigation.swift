//
//  HomeNavigation.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import Foundation

protocol HomeNavigationProtocol {
    var onClose: (() -> Void)? { get set}
    var onGoToCreateEvent: (() -> Void)? { get set}
}

struct HomeNavigation: HomeNavigationProtocol {
    var onClose: (() -> Void)?
    var onGoToCreateEvent: (() -> Void)?
}
