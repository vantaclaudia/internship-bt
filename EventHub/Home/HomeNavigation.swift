//
//  HomeNavigation.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import Foundation

protocol HomeNavigationProtocol {
    var onClose: (() -> Void)? { get set}
}

struct HomeNavigation: HomeNavigationProtocol {
    var onClose: (() -> Void)?
}