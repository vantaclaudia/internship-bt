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
                    .foregroundColor(getErrorTextColor())
                    .offset(y: !isFocused && self.text.isEmpty ? -1 : -20)
                    .font(.system(size: 15))
                if isSecure {
                    SecureField("", text: $text).focused($isFocused, equals: true).autocapitalization(.none).disableAutocorrection(true)
                } else {
                    TextField("", text: $text).focused($isFocused, equals: true).autocapitalization(.none).disableAutocorrection(true)
                }
            }
            Image(icon)
                .renderingMode(.template)
                .foregroundColor(getErrorIconColor())
                .padding()
        }
        .padding(.leading)
        .frame(width: 366, height: 64)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 2).foregroundColor(getBorderColor()))
        .background(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 0).background(getErrorBackgroundColor()))
        .cornerRadius(16)
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
        if isFocused {
            return Color("purple")
        } else {
            return Color("borderGrey")
        }
    }
    
    func getErrorBackgroundColor() -> Color {
        if isFocused && !text.isEmpty && errorMessage != "" {
            return Color("errorBackgroundColor")
        }  else {
            return Color(.white)
        }
    }
    
    func getErrorIconColor() -> Color {
        if isFocused && !text.isEmpty && errorMessage != "" {
            return Color(.red)
        }  else {
            return Color(.gray)
        }
    }
    
    func getErrorTextColor() -> Color {
        if isFocused && !text.isEmpty && errorMessage != "" {
            return Color("errorRedText")
        }  else {
            return Color(.gray)
        }
    }
    
    func getBorderColor() -> Color {
        if isFocused && text.isEmpty && errorMessage != "" {
            return Color("purple")
        } else if isFocused && !text.isEmpty && errorMessage != "" {
            return Color("errorRedText")
        } else {
            return Color("borderGrey")
        }
    }
}
