//
//  customInputButton.swift
//  EventHub
//
//  Created by internship on 17.11.2022.
//

import SwiftUI

struct customInputButton: View {
    @State private(set) var mail = ""
    public private(set) var inputText: String
    public private(set) var inputIconText: String 
    
    var body: some View {
        HStack {
            TextField("Adresa de e-mail", text: $mail)
            Image("envelope").foregroundColor(Color("borderGrey"))
        }
            .padding()
            .background(Color.white)
            .frame(width: 366, height: 64)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("borderGrey"), lineWidth: 1))
    }
}

struct customInputButton_Previews: PreviewProvider {
    static var previews: some View {
        customInputButton(inputText: "", inputIconText:"")
    }
}
