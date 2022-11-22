//
//  customInputButton.swift
//  EventHub
//
//  Created by internship on 17.11.2022.
//

import SwiftUI

struct CustomMailButton: View {
    var mail: String
    var icon: String
    @FocusState var isFocused: Bool
    @Binding var mailText: String
    
    
    init(mail: String, mailText: Binding<String>, icon: String) {
        self.mail = mail
        self.icon = icon
        self._mailText = mailText
    }
    
    var body: some View {
        HStack{
            ZStack(alignment: .leading){
                Text(mail)
                    .foregroundColor(!isFocused || self.mail.isEmpty ? Color("borderGrey") : Color("borderGrey"))
                    .offset(y: !isFocused || self.mail.isEmpty ? -2 : -25)
                    .scaleEffect(!isFocused || self.mail.isEmpty ? 1 : 0.81, anchor: .leading)
                
                TextField("", text: $mailText).focused($isFocused, equals: true)
            }
                Image(icon).foregroundColor(Color("borderGrey"))
                    .padding()
        }
        .padding(.top, 5)
        .padding(.leading)
        .frame(width: 366, height: 64)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 2).foregroundColor(getColor()))
    }
    
    func getColor() -> Color {
        if isFocused {return Color("purple")}
        else {return Color("borderGrey")}
    }
}

struct customMailButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomMailButton(mail: "", mailText: .constant(""), icon:"")
    }
}
