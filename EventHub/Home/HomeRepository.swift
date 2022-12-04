//
//  HomeRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import Foundation

protocol HomeRepositoryProtocol {
    func getUser() -> String
}

final class HomeRepository: HomeRepositoryProtocol {
    func getUser() -> String {
        "Vanta"
    }
}
