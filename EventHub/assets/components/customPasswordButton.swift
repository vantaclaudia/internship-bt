//
//  customPasswordButton.swift
//  EventHub
//
//  Created by internship on 18.11.2022.
//

import SwiftUI

struct customPasswordButton: View {
    @State private(set) var mail = ""
    public private(set) var inputText: String
    public private(set) var inputIconText: String
    
    var body: some View {
        HStack {
            SecureField(inputText, text: $mail)
            Image(inputIconText).foregroundColor(Color("borderGrey"))
        }
            .padding()
            .background(Color.white)
            .frame(width: 366, height: 64)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("borderGrey"), lineWidth: 1))
    }
}

struct customPasswordButton_Previews: PreviewProvider {
    static var previews: some View {
        customInputButton(inputText: "", inputIconText:"")
    }
}
