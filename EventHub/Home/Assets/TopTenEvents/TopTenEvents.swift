//
//  TopTenEvents.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

struct TopTenEvents: View {
    let events: [Event]
    
    init(events: [Event]) {
        self.events = events
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(events) { event in
                        TopTenEventsStyle(event: event, image: event.image)
                    }
                }
            }
        }
    }
}

struct TopTenEvents_Previews: PreviewProvider {
    static var previews: some View {
        TopTenEvents(events: [Event]())
    }
}
