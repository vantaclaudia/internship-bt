//
//  HeadEventDetails.swift
//  EventHub
//
//  Created by Claudia Vanta on 09.12.2022.
//

import SwiftUI

struct HeadEventDetails: View {
    let event: Event
    var image: String
    let action: () -> Void

    init(event: Event, image: String, action: @escaping () -> Void) {
        self.event = event
        self.image = image
        self.action = action
    }
    
    var body: some View {
        VStack(alignment: .leading) {
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
                }.frame(width: 414, height: 328).cornerRadius(50)
                HStack {
                    Button(action: action) {
                        Image("inapoi").padding(.trailing, 100)
                    }
                    Button(action: {
                        // share
                    }) {
                        Image("share").padding(.leading, 160)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 200)
            }
            Text("🎵 Muzică").foregroundColor(Color("darkPurple")).font(.system(size: 14)).bold()
                .padding(.leading, 30)
                .padding(.top, 5).padding(.bottom, 10)
            Text(event.eventName)
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .padding(.top, -30)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                .frame(width: 400, height: 40)
            HStack{
                Image("participants-large").frame(width: 148, height: 40)
                Text(event.participants + " " + "participanți").foregroundColor(Color.black).font(.system(size: 14)).fontWeight(.light)
            }.padding(.leading, 20).padding(.top, -25)
        }
    }
}
