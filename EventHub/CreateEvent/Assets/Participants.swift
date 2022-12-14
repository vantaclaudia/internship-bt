//
//  GenericInput.swift
//  EventHub
//
//  Created by Claudia Vanta on 25.11.2022.
//

import SwiftUI
import Combine

struct Participants: View {
    var placeholder: String
    var icon: String
    @FocusState var isFocused: Bool
    @Binding var text: String
    
    init(placeholder: String, icon: String, text: Binding<String>) {
        self.placeholder = placeholder
        self.icon = icon
        self._text = text
    }
    
    var body: some View {
        HStack{
            ZStack(alignment: .leading){
                Text(placeholder)
                    .foregroundColor(Color.gray)
                    .offset(y: !isFocused && self.text.isEmpty ? -1 : -20)
                    .font(.system(size: 15))
                TextField("", text: $text).focused($isFocused, equals: true).autocapitalization(.none).disableAutocorrection(true)
                    .keyboardType(.numberPad)
                    .onReceive(Just(text)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.text = filtered
                        }
                    }
            }
            Image(icon)
                .renderingMode(.template)
                .foregroundColor(Color.gray)
                .padding()
        }
        .padding(.leading)
        .frame(width: 366, height: 64)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 2).foregroundColor(Color.gray))
        .cornerRadius(16)
    }
}
