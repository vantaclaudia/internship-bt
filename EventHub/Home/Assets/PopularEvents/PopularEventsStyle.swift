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
        formatter.dateFormat = "d MMM" + " • " + "HH:mm" + " • "
        formatter.locale = Locale(identifier: "ro_RO")
        return formatter
    }()
}

struct PopularEventsStyle: View {
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
                    ZStack{
                        Color("lightGrey")
                        Text("Se încarcă...").foregroundColor(Color("borderGrey")).font(.system(size: 15))
                        
                    }
                }
                .frame(width: 304, height: 160)
                .cornerRadius(10)
                .padding(.top, 8).padding(.bottom, 0)
                .padding(.trailing, 8).padding(.leading, 8)
            }
            Text(event.eventName)
                .font(.system(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .fontWeight(.semibold)
                .frame(width: 297)
            HStack{
                Text(Formatter.bigCardDateFormat.string(from: event.date))
                    .foregroundColor(Color("purple"))
                    .textCase(.uppercase)
                Text(event.placeName)
                    .foregroundColor(Color("purple"))
                    .padding(.leading,-10)
            }
            .font(.system(size: 13))
            .padding(.leading, -90)
            .padding(.top, -10)
            .padding(.bottom, 5)
            HStack{
                Image("participants")
                Text(event.participants + " " + "participanți")
                    .foregroundColor(Color("borderGrey"))
            }
            .font(.system(size: 13))
            .padding(.trailing, 130)
            .padding(.top, -10)
            .padding(.bottom, 5)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 0.5)
    }
}
