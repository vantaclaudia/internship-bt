//
//  ProfileViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 09.12.2022.
//

import SwiftUI
import Firebase

protocol ProfileViewModelProtocol: ObservableObject { }

final class ProfileViewModel: ProfileViewModelProtocol {
    let repository: ProfileRepositoryProtocol
    let navigation: ProfileNavigationProtocol
    
    init(repository: ProfileRepositoryProtocol, navigation: ProfileNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
        
    }
}
