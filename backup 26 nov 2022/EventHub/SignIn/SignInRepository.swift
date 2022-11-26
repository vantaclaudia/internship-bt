//
//  SignInRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import Foundation

protocol SignInRepositoryProtocol {
    func getUser() -> String
}

final class SignInRepository: SignInRepositoryProtocol {
    func getUser() -> String {
        "Claudia"
    }
}
