//
//  CustomMailButton.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import Foundation
import SwiftUI

import SwiftUI

struct CustomPasswordInput: View {
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
                    .foregroundColor(self.passwordText.isEmpty ? Color("borderGrey") : Color("borderGrey"))
                    .offset(y: !isFocused && self.passwordText.isEmpty ? -2 : -25)
                    .scaleEffect( !isFocused && self.passwordText.isEmpty ? 1 : 0.85, anchor: .leading)
                    .animation(!isFocused && self.passwordText.isEmpty ? Animation.easeInOut(duration: 0) : Animation.easeIn(duration: 0.3), value: UUID())
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
        if isFocused {
            return Color("purple")
        } else {
            return Color("borderGrey")

        }
    }
    
}

    struct customPasswordInput_Previews: PreviewProvider {
        static var previews: some View {
            CustomPasswordInput(password: "", passwordText: .constant(""), icon:"")
        }
    }
