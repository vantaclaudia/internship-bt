//
//  ContentView.swift
//  EventHub
//
//  Created by internship on 14.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var password = ""
    @State private var mail = ""
    
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
                CustomMailButton(mail: "Adresa de e-mail", mailText: $mail, icon: "envelope")
                    .padding(.top, 5)
                CustomPasswordButton(password: "Parola", passwordText: $password, icon: "key")
                    .padding(.top, 5)
                CustomPurpleButton(buttonText: "INTRĂ ÎN CONT")
                    .padding(.top, 10)
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


