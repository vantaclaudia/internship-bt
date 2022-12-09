//
//  SearchSettingsComponent.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        HStack{
            VStack{
                Button {
                    //action
                } label: {
                    Image(systemName: "note.text")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("purple"))
                }
            }
            VStack{
                Button {
                    //action
                } label: {
                    Image("search")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("borderGrey"))
                }
            }
            .padding(.leading, 32)
            VStack{
                Button {
                    //action
                } label: {
                    Image("user")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("borderGrey"))
                }
            }
            .padding(.leading, 32)
        }
        .padding()
        .frame(width: 200, height: 56)
        .background(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 0).background(Color.white)).shadow(radius: 0.5)
        .cornerRadius(100)
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
