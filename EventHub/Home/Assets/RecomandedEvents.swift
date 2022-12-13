//
//  TopTenEvents.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

struct RecomandedCard {
    var id: Int
    var title, imageUrl: String
}

struct RecomandedEvents: View {

    let bigCards:[RecomandedCard] = [
        RecomandedCard(id: 0, title: "Curs de gastronomie: Cooking Around The" + "\n" +  "World", imageUrl: "man-cooking"),
    ]

    var body: some View {
    VStack {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(bigCards, id: \.id) { bigCard in
                    RecomandedCardView(bigCard: bigCard)
                    }.frame(width: 366, height: 379)
                }
            }
        }
    }
}

struct RecomandedCardView: View {
    
//    var id: Int
//    var title, imageUrl: String

    let bigCard: RecomandedCard

    var body: some View {
        VStack {
            ZStack{
                Image(bigCard.imageUrl)
                    .resizable()
                    .frame(width: 350, height: 260)
                    .cornerRadius(10)
                    .padding(.top, 8).padding(.bottom, 0)
                    .padding(.trailing, 8).padding(.leading, 8)
            }
            Text(bigCard.title)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding(.bottom, 9).padding(.leading, -30)
            HStack{
                Text("11 DEC").foregroundColor(Color("purple"))
                Image("ellipse")
                Text("09:00").foregroundColor(Color("purple"))
                Image("ellipse")
                Text("Institutul Culinar Escoffier").foregroundColor(Color("purple"))
            }
                .font(.system(size: 13))
                .padding(.trailing, 75).padding(.top, -10).padding(.bottom, 5)
            HStack{
                Image("participants")
                Text("2.5k participanți").foregroundColor(Color("borderGrey"))
            }
                .font(.system(size: 13))
                .padding(.trailing, 185).padding(.top, -10).padding(.bottom, 5)
        }.background(Color.white).cornerRadius(10).shadow(radius: 0.5)
    }
}

struct RecomandedEvents_Previews: PreviewProvider {
    static var previews: some View {
        RecomandedEvents()
    }
}
