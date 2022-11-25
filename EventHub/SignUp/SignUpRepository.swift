//
//  SignUpRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import Foundation

protocol SignUpRepositoryProtocol {
    func getUser() -> String
}

final class SignUpRepository: SignUpRepositoryProtocol {
    func getUser() -> String {
        "Vanta"
    }
}
