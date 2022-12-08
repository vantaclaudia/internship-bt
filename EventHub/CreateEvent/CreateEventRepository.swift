//
//  CreateEventRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import Foundation
import Firebase

protocol CreateEventRepositoryProtocol {
    func addEventToDB(eventName: String, date: Date, placeName: String, participants: String, description: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void
}

final class CreateEventRepository: CreateEventRepositoryProtocol {
    func addEventToDB(eventName: String, date: Date, placeName: String, participants: String, description: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void {
        let db = Firestore.firestore()
        db.collection("events").document().setData(["eventName": eventName, "date": date, "placeName": placeName, "participants": participants, "description": description]) { error in
            if let error = error {
                onResponse(.failure(error))
            } else {
                onResponse(.success(()))
            }
        }
    }
}


