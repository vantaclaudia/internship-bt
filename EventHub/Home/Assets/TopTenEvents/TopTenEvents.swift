//
//  TopTenEvents.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

struct TopTenEvents: View {
    let events: [Event]
    let goToEventDetails: (String) -> Void
    
    init(events: [Event], goToEventDetails: @escaping (String) -> Void) {
        self.events = events
        self.goToEventDetails = goToEventDetails
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(events) { event in
                        TopTenEventsStyle(event: event, image: event.image)
                            .onTapGesture {
                                goToEventDetails(event.id ?? "")
                        }
                    }
                }
            }
        }
    }
}
