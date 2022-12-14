//
//  RecomandedEventsParent.swift
//  EventHub
//
//  Created by Claudia Vanta on 14.12.2022.
//

import SwiftUI

struct RecomandedEventsParent: View {
    let recomandedEvents: [Event]
    
    init(recomandedEvents: [Event]) {
        self.recomandedEvents = recomandedEvents
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recomandedEvents) { event in
                        PopularEventsStyle(event: event, image: event.image)
                    }
                }
            }
        }
    }
}

struct RecomandedEventsParent_Previews: PreviewProvider {
    static var previews: some View {
        RecomandedEventsParent(recomandedEvents: [Event]())
    }
}
