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
                .foregroundColor(Color.black)
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
