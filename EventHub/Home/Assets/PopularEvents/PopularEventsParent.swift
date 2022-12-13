//
//  PopularEventsParent.swift
//  EventHub
//
//  Created by Claudia Vanta on 13.12.2022.
//

import SwiftUI

struct PopularEventsParent: View {
    let events: [Event]
    
    init(events: [Event]) {
        self.events = events
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(events) { event in
                        PopularEventsStyle(event: event)
                    }
                }
            }
        }
    }
}

struct PopularEventsParent_Previews: PreviewProvider {
    static var previews: some View {
        PopularEventsParent(events: [Event]())
    }
}
