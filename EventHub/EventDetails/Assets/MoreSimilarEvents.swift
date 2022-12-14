//
//  TopTenEvents.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

struct MoreSimilarCard {
    var id: Int
    var title, imageUrl: String
}

struct MoreSimilarEvents: View {
    
    let moreSimilarCards:[MoreSimilarCard] = [
        MoreSimilarCard(id: 0, title: "GH 10.12: Rhadoo, Cezar, GEF live" + "\n" + "", imageUrl: "live"),
        MoreSimilarCard(id: 1, title: "GH 10.12: Rhadoo, Cezar, GEF live" + "\n" + "", imageUrl: "men"),
        MoreSimilarCard(id: 2, title: "GH 10.12: Rhadoo, Cezar, GEF live" + "\n" + "", imageUrl: "live"),
        MoreSimilarCard(id: 3, title: "GH 10.12: Rhadoo, Cezar, GEF live" + "\n" + "", imageUrl: "men"),
    ]

    var body: some View {
    VStack {
        HStack{
            Text("Mai multe evenimente similare").padding(.leading, -30).padding(.trailing, 50)
            Text("Vezi toate").font(.system(size: 13)).foregroundColor(Color("darkPurple")).bold()
        }
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                HStack{
                    ForEach(moreSimilarCards, id: \.id) { moreSimilarCard in
                        MoreSimilarCardView(moreSimilarCard: moreSimilarCard)
                    }.frame(width: 320, height: 279)
                }
            }
            }
        }.padding(.leading, 40)
    }
}

struct MoreSimilarCardView: View {

    let moreSimilarCard: MoreSimilarCard

    var body: some View {
        VStack {
            ZStack{
                Image(moreSimilarCard.imageUrl)
                    .resizable()
                    .frame(width: 304, height: 160)
                    .cornerRadius(10)
                    .padding(.top, 8).padding(.bottom, 0)
                    .padding(.trailing, 8).padding(.leading, 8)
            }
            Text(moreSimilarCard.title)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding(.bottom, 9).padding(.leading, -50)
            HStack{
                Text("10 DEC").foregroundColor(Color("purple"))
                Image("ellipse")
                Text("20:00").foregroundColor(Color("purple"))
                Image("ellipse")
                Text("Club Guesthouse").foregroundColor(Color("purple"))
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

struct MoreSimilarEvents_Previews: PreviewProvider {
    static var previews: some View {
        MoreSimilarEvents()
    }
}
