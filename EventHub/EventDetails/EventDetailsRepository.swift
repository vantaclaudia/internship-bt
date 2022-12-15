//
//  EventDetailsRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 08.12.2022.
//

import Foundation
import Firebase

protocol EventDetailsRepositoryProtocol {
    func getEvent(id: String) async throws -> Event
}

final class EventDetailsRepository: EventDetailsRepositoryProtocol {
    let db = Firestore.firestore()
    
    func getEvent(id: String) async throws -> Event {
        do {
            let snapshot = try await db.collection("events").document(id).getDocument().data(as: Event.self)
            return snapshot
        }
        catch {
            throw error
        }
    }
}
