//
//  HeadEventDetails.swift
//  EventHub
//
//  Created by Claudia Vanta on 09.12.2022.
//

import SwiftUI

struct HeadEventDetails: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("men-large").frame(width: 414, height: 328).cornerRadius(50)
                    .overlay(Image("inapoi").position(x: 50, y: 70))
                    .overlay(Image("share").position(x: 350, y: 70))
            Text("🎵 Muzică").foregroundColor(Color("darkPurple")).font(.system(size: 14)).bold().padding(.leading, -180).padding(.top, 5).padding(.bottom, -5)
            Text("Depeche Mode în București -  Memento Mori Tour")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .padding(.bottom, 9).padding(.leading, -27).padding(.top, -40)
                .frame(width: 400, height: 70)
            HStack{
                Image("participants-large").frame(width: 148, height: 40)
                Text("2.5k participanți").foregroundColor(Color.black).font(.system(size: 14)).fontWeight(.light)
            }.padding(.leading, 20).padding(.top, -25)
        }
    }
}

struct HeadEventDetails_Previews: PreviewProvider {
    static var previews: some View {
        HeadEventDetails()
    }
}
