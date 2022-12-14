//
//  DetailButtons.swift
//  EventHub
//
//  Created by Claudia Vanta on 09.12.2022.
//

import SwiftUI

struct DetailButtons: View {
    var buttonText: String
    var icon: String
    var action: () -> Void
    
    
    init(
        buttonText: String, icon: String, action: @escaping () -> Void) {
            self.buttonText = buttonText
            self.icon = icon
            self.action = action
        }
    
    var body: some View {
        ZStack{
            Button(action: {
                action()
            }) {
                Image(icon)
                    .foregroundColor(Color("purple"))
                    .padding(.leading, 10).padding(.top, -2)
                Text(buttonText).fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 16).padding(.bottom, 16).padding(.trailing, 8)
                    .frame(height: 40)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("darkPurple"))
                    .font(.system(size: 13))
            }
            .overlay(RoundedRectangle(cornerRadius: 100).stroke(lineWidth: 2).foregroundColor(Color("purple")))
            .background(RoundedRectangle(cornerRadius: 100).stroke(lineWidth: 0).background(Color.white))
            .cornerRadius(100)
        }
    }
}

struct DetailButtons_Previews: PreviewProvider {
    static var previews: some View {
        DetailButtons(buttonText: "", icon: "") { }
    }
}
