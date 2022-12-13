//
//  TopTenEventsNew.swift
//  EventHub
//
//  Created by Claudia Vanta on 12.12.2022.
//

import SwiftUI

extension Formatter {
    static let smallCardDateFormat: DateFormatter = {
    let formatter = DateFormatter()
        formatter.dateFormat = "d MMM" + " • " + "HH:mm"
        formatter.locale = Locale(identifier: "ro_RO")
        return formatter
    }()
}

struct TopTenEventsStyle: View {
    let event: Event
    
    
    init(event: Event) {
        self.event = event
    }
    
    var body: some View {
        VStack {
            ZStack{
                Image(event.image)
                    .resizable()
                    .frame(width: 159, height: 109)
                    .cornerRadius(10)
                    .padding(.top, 8).padding(.bottom, 0)
                    .padding(.trailing, 8).padding(.leading, 8)
                    .overlay(Image("").position(x: 32, y: 32))
            }
            Text(event.eventName)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .frame(width: 155)
                .font(.system(size: 13))
                .fontWeight(.semibold)
                .padding(.bottom, 9)
            HStack{
                Text(Formatter.smallCardDateFormat.string(from: event.date))
                    .foregroundColor(Color("purple"))
                    .textCase(.uppercase)
            }
            .font(.system(size: 13))
            .padding(.leading, -60).padding(.top, -10).padding(.bottom, 5)
        }.background(Color.white).cornerRadius(10).shadow(radius: 0.5)
    }
}

struct TopTenEventsStyle_Previews: PreviewProvider {
    static var previews: some View {
        TopTenEventsStyle(event: Event(image: "vincent-van-gogh", currentUsers: "1", eventName: "Vincent Van Gogh - The museum of arts", date: Date(), placeName: "Oradea, Romania", participants: "350", description: "Descriere"))
    }
}
