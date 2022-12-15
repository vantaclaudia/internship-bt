//
//  PopularEventsParent.swift
//  EventHub
//
//  Created by Claudia Vanta on 13.12.2022.
//

import SwiftUI

struct PopularEventsParent: View {
    let popularEvents: [Event]
    let goToEventDetails: (String) -> Void
    
    init(popularEvents: [Event], goToEventDetails: @escaping (String) -> Void) {
        self.popularEvents = popularEvents
        self.goToEventDetails = goToEventDetails
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(popularEvents) { event in
                        PopularEventsStyle(event: event, image: event.image)
                            .onTapGesture {
                                goToEventDetails(event.id ?? "")
                        }
                    }
                }
            }
        }
    }
}
