//
//  CreateEventRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import Foundation

protocol CreateEventRepositoryProtocol {
    func getUser() -> String
}

final class CreateEventRepository: CreateEventRepositoryProtocol {
    func getUser() -> String {
        "Vanta"
    }
}
