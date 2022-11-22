//
//  customPasswordButton.swift
//  EventHub
//
//  Created by internship on 18.11.2022.
//

import SwiftUI

struct CustomPasswordButton: View {
    var password: String
    var icon: String
    @FocusState var isFocused: Bool
    @Binding var passwordText: String
    
    
    init(password: String, passwordText: Binding<String>, icon: String) {
        self.password = password
        self.icon = icon
        self._passwordText = passwordText
    }
    
    var body: some View {
        HStack{
            ZStack(alignment: .leading){
                Text(password)
                    .foregroundColor(!isFocused || self.password.isEmpty ? Color("borderGrey") : Color("borderGrey"))
                    .offset(y: !isFocused || self.password.isEmpty ? -2 : -25)
                    .scaleEffect(!isFocused || self.password.isEmpty ? 1 : 0.81, anchor: .leading)
                
                SecureField("", text: $passwordText).focused($isFocused, equals: true)
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

    struct customPasswordButton_Previews: PreviewProvider {
        static var previews: some View {
            CustomPasswordButton(password: "", passwordText: .constant(""), icon:"")
        }
    }


