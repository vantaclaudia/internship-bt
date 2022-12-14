//
//  TopTenEvents.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

extension Formatter {
    static let bigCardDateFormat: DateFormatter = {
    let formatter = DateFormatter()
        formatter.dateFormat = "d MMM" + " • " + "HH:mm" + " • " + "Arena Națională"
        formatter.locale = Locale(identifier: "ro_RO")
        return formatter
    }()
}
struct PopularEventsStyle: View {
    let event: Event
    
    
    init(event: Event) {
        self.event = event
    }

    var body: some View {
        VStack {
            ZStack{
                Image(bigCard.imageUrl)
                    .resizable()
                    .frame(width: 304, height: 160)
                    .cornerRadius(10)
                    .padding(.top, 8).padding(.bottom, 0)
                    .padding(.trailing, 8).padding(.leading, 8)
            }
            Text(bigCard.title)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding(.bottom, 9).padding(.leading, -70)
            HStack{
                Text("26 OCT").foregroundColor(Color("purple"))
                Image("ellipse")
                Text("17:00").foregroundColor(Color("purple"))
                Image("ellipse")
                Text("Arena Națională").foregroundColor(Color("purple"))
            }
                .font(.system(size: 13))
                .padding(.trailing, 75).padding(.top, -10).padding(.bottom, 5)
            HStack{
                Image("participants")
                Text("2.5k participanți").foregroundColor(Color("borderGrey"))
            }
                .font(.system(size: 13))
                .padding(.trailing, 130).padding(.top, -10).padding(.bottom, 5)
        }.background(Color.white).cornerRadius(10).shadow(radius: 0.5)
    }
}

struct PopularEvents_Previews: PreviewProvider {
    static var previews: some View {
        PopularEvents(event: event)
    }
}
