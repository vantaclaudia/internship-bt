//
//  TopTenEvents.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

struct Box {
    var id: Int
    var title, imageUrl, imageNumber: String
}

struct TopTenEvents: View {
    
    let boxes:[Box] = [
        Box(id: 0, title: "Vincent Van Gogh:" + "\n" +  "O experiență imersivă", imageUrl: "vincent-van-gogh", imageNumber: "1"),
        Box(id: 1, title: "Petrecere costumată de Halloween", imageUrl: "petrecere-halloween", imageNumber: "2"),
        Box(id: 2, title: "Vincent Van Gogh:" + "\n" +  "O experiență imersivă", imageUrl: "vincent-van-gogh", imageNumber: "1"),
        Box(id: 3, title: "Petrecere costumată de Halloween", imageUrl: "petrecere-halloween",imageNumber: "2"),
        Box(id: 4, title: "Vincent Van Gogh:" + "\n" +  "O experiență imersivă", imageUrl: "vincent-van-gogh",imageNumber: "1"),
    ]

    var body: some View {
    VStack {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(boxes, id: \.id) { box in
                    BoxView(box: box)
                    }.frame(width: 175, height: 189)
                }
            }
        }
    }
}

struct BoxView: View {

    let box: Box

    var body: some View {
        VStack {
            ZStack{
//                Image("1")
                Image(box.imageUrl)
                    .resizable()
                    .frame(width: 159, height: 109)
                    .cornerRadius(10)
                    .padding(.top, 8).padding(.bottom, 0)
                    .padding(.trailing, 8).padding(.leading, 8)
                    .overlay(Image(box.imageNumber).position(x: 32, y: 32))
            }
            Text(box.title)
                .font(.system(size: 13))
                .fontWeight(.semibold)
                .padding(.bottom, 9).padding(.leading, -10)
            HStack{
                Text("26 OCT").foregroundColor(Color("purple"))
                Image("ellipse")
                Text("17:00").foregroundColor(Color("purple"))
            }
                .font(.system(size: 13))
                .padding(.leading, -50).padding(.top, -10).padding(.bottom, 5)
        }.background(Color.white).cornerRadius(10).shadow(radius: 0.5)
    }
}

struct TopTenEvents_Previews: PreviewProvider {
    static var previews: some View {
        TopTenEvents()
    }
}
