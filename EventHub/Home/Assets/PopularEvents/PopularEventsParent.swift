//
//  PopularEventsParent.swift
//  EventHub
//
//  Created by Claudia Vanta on 13.12.2022.
//

import SwiftUI

struct PopularEventsParent: View {
    let popularEvents: [Event]
    
    init(popularEvents: [Event]) {
        self.popularEvents = popularEvents
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(popularEvents) { event in
                        PopularEventsStyle(event: event, image: event.image)
                    }
                }
            }
        }
    }
}

struct PopularEventsParent_Previews: PreviewProvider {
    static var previews: some View {
        PopularEventsParent(popularEvents: [Event]())
    }
}
