//
//  customButton.swift
//  EventHub
//
//  Created by internship on 17.11.2022.
//

import SwiftUI

struct customPurpleButton: View {
    public private(set) var buttonText: String 
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 366, height: 64)
                .foregroundColor(Color("purple"))
            Text(buttonText).bold()
                .textCase(.uppercase)
                .foregroundColor(.white)
        }}
}

struct customButton_Previews: PreviewProvider {
    static var previews: some View {
        customPurpleButton(buttonText: "")
    }
}
