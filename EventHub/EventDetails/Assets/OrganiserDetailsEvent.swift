//
//  OrganiserDetailsEvent.swift
//  EventHub
//
//  Created by Claudia Vanta on 09.12.2022.
//

import SwiftUI

struct OrganiserDetailsEvent: View {
    let event: Event
    var action: () -> Void

    init(event: Event, action: @escaping () -> Void) {
        self.event = event
        self.action = action
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Button(action: {
                    action()
                }) {
                    Image("organizer")
                    VStack(alignment: .leading) {
                        Text("EMAGIC").fontWeight(.bold).foregroundColor(.black).font(.system(size: 16))
                        Text("Organizator").font(.system(size: 14)).foregroundColor(.black).fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 3)
                    Image("arrow-right")
                        .padding(.trailing, 50)
                }
            }.background(Color("white").cornerRadius(16).frame(width: 366, height: 56))
            //Despre eveniment
            Text("Despre eveniment").fontWeight(.semibold).font(.system(size: 16)).padding(.top, 10)
            Text(event.description)
            Text("...vezi descrierea completă").font(.system(size: 14)).foregroundColor(Color("darkPurple")).bold()
            //Locatie
            Text("Locație").fontWeight(.semibold).font(.system(size: 16)).padding(.top, 10).padding(.trailing, 30)
            Image("locationPicture").resizable().frame(width: 366, height: 180).padding(.top, 10).padding(.trailing, 20)
        }.padding(.trailing, 10).padding(.leading, 30).padding(.top)
    }
}
