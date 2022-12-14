//
//  TopTenEvents.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

extension Formatter {
    static let randomCardDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM" + " • " + "HH:mm" + " • "
        formatter.locale = Locale(identifier: "ro_RO")
        return formatter
    }()
}
struct RecomandedEventsStyle: View {
    let event: Event
    var image: String
    
    init(event: Event, image: String) {
        self.event = event
        self.image = image
    }
    
    var body: some View {
        VStack {
            ZStack{
                AsyncImage(url: URL(string: image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                }
                .frame(width: 350, height: 260)
                .cornerRadius(10)
                .padding(.top, 8).padding(.bottom, 0)
                .padding(.trailing, 8).padding(.leading, 8)
            }
            Text(event.eventName)
                .font(.system(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .fontWeight(.semibold)
                .padding(.bottom, 9)
                .frame(width: 350)
            HStack{
                Text(Formatter.bigCardDateFormat.string(from: event.date))
                    .textCase(.uppercase)
                Text(event.placeName)
                    .padding(.leading, -10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .frame(width: 350)
            .foregroundColor(Color("purple"))
            .font(.system(size: 13))
            .padding(.top, -10)
            .padding(.bottom, 5)
            HStack{
                Image("participants")
                Text(event.participants + " " + "participanți")
                    .foregroundColor(Color("borderGrey"))
            }
            .font(.system(size: 13))
        }
        .background(Color.white).cornerRadius(10).shadow(radius: 0.5)
    }
}
