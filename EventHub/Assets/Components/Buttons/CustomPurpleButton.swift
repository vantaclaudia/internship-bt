//
//  CustomPurpleButton.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import Foundation
import SwiftUI

struct CustomPurpleButton: View {
    var buttonText: String
    var action: () -> Void
    
    init(buttonText: String, action: @escaping () -> Void) {
        self.buttonText = buttonText
        self.action = action
    }
    
    var body: some View {
        ZStack{
            Button(action: {
                action()
            }) {
                Text(buttonText).bold()
                    .padding()
                    .textCase(.uppercase)
                    .foregroundColor(.white)
            }
            .background(RoundedRectangle(cornerRadius: 16)
                .frame(width: 366, height: 64)
                .foregroundColor(Color("purple"))
                .textCase(.uppercase)
                .foregroundColor(.white)
            )
        }
    }
}

struct customButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomPurpleButton(buttonText: "") { }
    }
}
