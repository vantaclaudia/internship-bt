//
//  SearchSettingsComponent.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import SwiftUI

struct SearchSettingsComponent: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            HStack{
                ZStack(alignment: .leading){
                    HStack{
                        Image("search")
                            .renderingMode(.template)
                            .foregroundColor(Color("lightPurple"))
                        ZStack(alignment: .leading) {
                            if searchText.isEmpty {
                                Text("Caută evenimente")
                                    .foregroundColor(Color("lightPurple"))
                                    .font(.system(size: 14))
                            }
                            TextField("", text: $searchText)
                                .foregroundColor(Color("lightPurple"))
                                .font(.system(size: 14))
                                .overlay(
                                    Image(systemName: "xmark.circle.fill")
                                        .padding()
                                        .offset(x: 110)
                                        .foregroundColor(Color("lightPurple"))
                                        .opacity(searchText.isEmpty ? 0.0 : 5)
                                        .onTapGesture {
                                            searchText = ""
                                        })
                        }
                    }
                    .foregroundColor(Color("lightPurple"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.leading)
            .frame(width: 308, height: 40)
            .background(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 0).background(Color("purple")))
            .cornerRadius(20)
            HStack{
                Button {
                    //action
                } label: {
                    Image("settings")
                        .renderingMode(.template)
                        .foregroundColor(Color.white)
                }
            }
            .padding()
            .frame(width: 40, height: 40)
            .background(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 0).background(Color("purple")))
            .cornerRadius(20)
        }
    }
}

struct SearchSettingsComponent_Previews: PreviewProvider {
    static var previews: some View {
        SearchSettingsComponent(searchText: .constant(""))
    }
}
