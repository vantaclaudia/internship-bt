//
//  ContentView.swift
//  EventHub
//
//  Created by internship on 14.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Image("splashScreen-logo")
                .frame(width: 294.0, height: 88.0)
                    .scaledToFit()
            customInputButton(inputText: "Adresa de e-mail", inputIconText: "envelope")
            customInputButton(inputText: "Parola", inputIconText: "key")
            customPurpleButton(buttonText: "Intră în cont")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
