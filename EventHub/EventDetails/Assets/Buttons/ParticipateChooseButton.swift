//
//  ParticipateChooseButton.swift
//  EventHub
//
//  Created by Claudia Vanta on 09.12.2022.
//

import SwiftUI

struct ParticipateChooseButton: View {
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        HStack{
            Button(action: {
                action()
            }) {
                HStack{
                    Image("checkmark-circle")
                    Text("PARTICIP").fontWeight(.bold).foregroundColor(Color("purple")).font(.system(size: 16))
                }.frame(maxWidth: .infinity, alignment: .center).padding(.leading, 80)
                Image("arrow-down")
                    .padding(.trailing, 50)
            }
        }
        .frame(width: 366, height: 64)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 2).foregroundColor(Color("purple")))
        .background(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 0).background(Color.white))
        .cornerRadius(16)
    }
}

struct ParticipateChooseButton_Previews: PreviewProvider {
    static var previews: some View {
        ParticipateChooseButton() { }
    }
}
