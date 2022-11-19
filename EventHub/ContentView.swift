//
//  ContentView.swift
//  EventHub
//
//  Created by internship on 14.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        VStack {
            VStack {
                Image("splashScreen-logo")
                    .frame(width: 294.0, height: 88.0)
                    .scaledToFit()
                    .padding(.top, 30)
                    .padding(.bottom, 40)
            }
            VStack {
                Text("Autentifică-te").bold()
                    .font(.system(size: 24))
                    .lineSpacing(29)
                    .frame(width: 360, height: 29, alignment: .topLeading)
            }
            VStack {
//                customInputButton(inputText: "Adresa de e-mail", inputIconText: "envelope")
//                    .padding(.top, 5)
//                customPasswordButton(inputText: "Parola", inputIconText: "key")
//                    .padding(.top, 5)
                customPurpleButton(buttonText: "INTRĂ ÎN CONT")
                    .padding(.top, 5)
            }
            Spacer()
                HStack {
                    Text("Nu ai cont?")
                    Text("Înregistrează-te")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
