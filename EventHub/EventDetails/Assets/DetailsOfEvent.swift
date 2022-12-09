//
//  DetailsOfEvent.swift
//  EventHub
//
//  Created by Claudia Vanta on 09.12.2022.
//

import SwiftUI

struct DetailsOfEvent: View {
    var body: some View {
        // CALENDAR
        VStack(alignment: .leading) {
            HStack {
                Image("calendar-large")
                    .padding(.bottom, 35).padding(.trailing, 5)
                VStack(alignment: .leading){
                    Text("Duminică, 26 Octombrie 2023")
                        .frame(height: 15)
                        .font(.system(size: 16))
                        .bold()
                    Text("17:00 - 23:00")
                        .font(.system(size: 14))
                    DetailButtons(buttonText: "Adaugă în calendar", icon: "calendar") { }
                }
            }
            .padding(.bottom, 10)
            
            // MAP
            HStack {
                Image("location-large")
                    .padding(.bottom, 35).padding(.trailing, 5)
                VStack(alignment: .leading){
                    Text("Arena Națională")
                        .frame(height: 15)
                        .font(.system(size: 16))
                        .bold()
                    Text("Bulevardul Basarabia 37-39, București" + "\n" + "022103")
                        .font(.system(size: 14))
                    DetailButtons(buttonText: "Vezi locația pe hartă", icon: "location") { }
                }
            }
            .padding(.bottom, 10)
            
            //TICKETS
            HStack {
                Image("ticket-large")
                    .padding(.bottom, 35).padding(.trailing, 5)
                VStack(alignment: .leading){
                    Text("Bilete")
                        .frame(height: 15)
                        .font(.system(size: 16))
                        .bold()
                    Text("bilete.emagic.ro")
                        .font(.system(size: 14))
                    DetailButtons(buttonText: "Cumpără bilete", icon: "ticket") { }
                }
            }
            .padding(.bottom, 10)
        }.padding(.leading, -50).padding(.top)
    }
}

struct DetailsOfEvent_Previews: PreviewProvider {
    static var previews: some View {
        DetailsOfEvent()
    }
}
