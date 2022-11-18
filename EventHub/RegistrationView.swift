//
//  RegistrationView.swift
//  EventHub
//
//  Created by internship on 18.11.2022.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Înregistrează-te").bold()
                    .font(.system(size: 24))
                    .lineSpacing(29)
                    .frame(width: 360, height: 29, alignment: .topLeading)
                    .padding(.top, 30)
            }
            VStack {
                customInputButton(inputText: "Numele și Prenumele", inputIconText: "user")
                    .padding(.top, 5)
                customInputButton(inputText: "Adresa de e-mail", inputIconText: "envelope")
                    .padding(.top, 5)
                customPasswordButton(inputText: "Parola", inputIconText: "key")
                    .padding(.top, 5)
                customPasswordButton(inputText: "Confirmă parola", inputIconText: "key")
                    .padding(.top, 5)
                customPurpleButton(buttonText: "CREEAZĂ CONT")
                    .padding(.top, 20)
            }
            Spacer()
            HStack {
                Text("Ai deja cont?")
                NavigationLink(destination: ContentView(), label: {
                    Text("Autentifică-te")
                        .foregroundColor(Color("purple")).bold()
                })
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
