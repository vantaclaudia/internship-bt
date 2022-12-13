//
//  Event.swift
//  EventHub
//
//  Created by Claudia Vanta on 12.12.2022.
//

import Foundation
import FirebaseFirestoreSwift
import SwiftUI

struct Event: Identifiable, Decodable {
    @DocumentID var id: String?
    var image: String
    var currentUsers: String
    var eventName: String
    var date: Date
    var placeName: String
    var participants: String
    var description: String
}

