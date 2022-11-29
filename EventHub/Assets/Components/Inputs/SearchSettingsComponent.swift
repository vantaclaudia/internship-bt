//
//  SearchSettingsComponent.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import SwiftUI

struct SearchSettingsComponent: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack{
            HStack{
                ZStack(alignment: .leading){
                    HStack{
                        Image("search")
                            .renderingMode(.template)
                            .foregroundColor(Color("lightPurple"))
                        
                        Text("Caută evenimente")
//                            .searchable(text: $searchText, prompt: "Cauta un eveniment")
                            .foregroundColor(Color("lightPurple"))
                        //                    .offset(y: !isFocused && self.text.isEmpty ? -1 : -20)
                            .font(.system(size: 14))
                    }.frame(maxWidth: .infinity, alignment: .leading)
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
        SearchSettingsComponent()
    }
}
