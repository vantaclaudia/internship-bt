//
//  GenericInput.swift
//  EventHub
//
//  Created by Claudia Vanta on 25.11.2022.
//

import SwiftUI

struct GenericInput: View {
    var placeholder: String
    var icon: String
    var errorMessage: String
    var isSecure: Bool
    @FocusState var isFocused: Bool
    @Binding var text: String
    
    init(placeholder: String, icon: String, errorMessage: String, isSecure: Bool, text: Binding<String>) {
        self.placeholder = placeholder
        self.icon = icon
        self.errorMessage = errorMessage
        self.isSecure = isSecure
        self._text = text
    }
    
    var body: some View {
        HStack{
            ZStack(alignment: .leading){
                Text(placeholder)
                    .foregroundColor(!isFocused || self.text.isEmpty ? Color("borderGrey") : Color("borderGrey"))
                    .offset(y: !isFocused && self.text.isEmpty ? -1 : -20)
                if isSecure {
                    SecureField("", text: $text).focused($isFocused, equals: true).autocapitalization(.none)
                } else {
                    TextField("", text: $text).focused($isFocused, equals: true).autocapitalization(.none)
                }
            }
            Image(icon).foregroundColor(Color("borderGrey"))
                .padding()
        }
        .padding(.leading)
        .frame(width: 366, height: 64)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 2).foregroundColor(getColor()))
        HStack{
            if !text.isEmpty {
                Text(errorMessage).font(.system(size: 12))
                    .padding(-10)
                    .frame(width: 366, alignment: .leading)
                    .padding(.leading).padding(.leading)
                    .foregroundColor(Color("errorRedText"))
            } else {
                Text("").font(.system(size: 0))
                    .padding(.top, -60)
                    .frame(width: 366, alignment: .leading)
                    .padding(.leading).padding(.leading)
            }
        }
    }
    
    func getColor() -> Color {
        if isFocused && errorMessage == "" {
            return Color("purple")
        } else {return Color("borderGrey")}
    }
}
