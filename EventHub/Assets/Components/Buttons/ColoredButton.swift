//
//  ColoredButton.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

struct ColoredButton: View {
    var buttonText: String
    var buttonColor: Color
    
    var body: some View {
        ZStack{
            Button(action: {
                //action
            }) {
                Text(buttonText)
                .padding()
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .font(.system(size: 13))
                .padding(.top, 8).padding(.bottom, 8).padding(.leading, 5).padding(.trailing, 5)
            }
            .background(RoundedRectangle(cornerRadius: 100)
                .frame(height: 40)
                .foregroundColor(buttonColor)
            )
        }
    }
}

struct ColoredButton_Previews: PreviewProvider {
    static var previews: some View {
        ColoredButton(buttonText: "", buttonColor: Color(""))
    }
}
