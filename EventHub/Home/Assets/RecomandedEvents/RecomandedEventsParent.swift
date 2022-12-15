//
//  RecomandedEventsParent.swift
//  EventHub
//
//  Created by Claudia Vanta on 14.12.2022.
//

import SwiftUI

struct RecomandedEventsParent: View {
    let recomandedEvents: [Event]
    let goToEventDetails: (String) -> Void
    
    init(recomandedEvents: [Event], goToEventDetails: @escaping (String) -> Void) {
        self.recomandedEvents = recomandedEvents
        self.goToEventDetails = goToEventDetails
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recomandedEvents) { event in
                        RecomandedEventsStyle(event: event, image: event.image)
                            .onTapGesture {
                                goToEventDetails(event.id ?? "")
                        }
                    }
                }
            }
        }
    }
}
