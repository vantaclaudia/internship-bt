//
//  HomeNavigation.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import Foundation

protocol HomeNavigationProtocol {
    var onGoToCreateEvent: (() -> Void)? { get set}
    var onGoToEventDetails: ((String) -> Void)? { get set}
}

struct HomeNavigation: HomeNavigationProtocol {
    var onGoToCreateEvent: (() -> Void)?
    var onGoToEventDetails: ((String) -> Void)?
}
