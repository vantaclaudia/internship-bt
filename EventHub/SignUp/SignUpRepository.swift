//
//  SignUpRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import Foundation
import Firebase

protocol SignUpRepositoryProtocol {
    func getUser() -> String
    func createUser(username: String, mail: String, password: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void
}

final class SignUpRepository: SignUpRepositoryProtocol {
    func getUser() -> String {
        "Vanta"
    }
    
    func signUp(id: String, username: String, mail: String, password: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void {
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(["username": username, "mail": mail, "password": password]) { error in
            if let error = error {
                onResponse(.failure(error))
            } else {
                onResponse(.success(()))
            }
        }
    }
    
    func createUser(username: String, mail: String, password: String, onResponse: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: mail, password: password) { result, error in
            if let error = error {
                onResponse(.failure(error))
                return
            }
            let userID = result?.user.uid
            self.signUp(id: userID ?? "", username: username, mail: mail, password: password) { result in
                switch result {
                case .success:
                    onResponse(.success(()))
                case .failure(let error):
                    onResponse(.failure(error))
                }
            }
        }
    }
}
