//
//  EventDetailsNavigation.swift
//  EventHub
//
//  Created by Claudia Vanta on 08.12.2022.
//

import Foundation

protocol EventDetailsNavigationProtocol {
    var onGoToHome: (() -> Void)? { get set}
}

struct EventDetailsNavigation: EventDetailsNavigationProtocol {
    var onGoToHome: (() -> Void)?
}
