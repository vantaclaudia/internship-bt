//
//  HomeRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import Foundation
import Firebase

protocol HomeRepositoryProtocol {
    func fetchEvents() async -> [Event]
    func orderPopularEvents() async -> [Event]
    func recomandedEvents() async -> [Event]
}

final class HomeRepository: HomeRepositoryProtocol {
    func fetchEvents() async -> [Event] {
        let db = Firestore.firestore()
        let querySnapshot = try? await db.collection("events").getDocuments()
        let result = querySnapshot?.documents.compactMap {
            try? $0.data(as: Event.self)
        } ?? []
        return result
    }
    
    // function for ordering cards after number f participants and also if date should be in the future
    func orderPopularEvents() async -> [Event] {
        let db = Firestore.firestore()
        let querySnapshot = try? await db.collection("events").order(by: "participants").limit(to: 10).getDocuments()
        let result = querySnapshot?.documents.compactMap {
            try? $0.data(as: Event.self)
        } ?? []
        return result
    }
    
    func recomandedEvents() async -> [Event] {
        let db = Firestore.firestore()
        let querySnapshot = try? await db.collection("events").limit(to: 1).getDocuments()
        let result = querySnapshot?.documents.compactMap {
            try? $0.data(as: Event.self)
        } ?? []
        return result
    }
}
