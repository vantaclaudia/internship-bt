//
//  OnErrorMessage.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import SwiftUI

struct OnErrorMessage: View {
    @ObservedObject var emailObj = EmailValidationObj()
    
    var body: some View {
        Text(emailObj.error)
                    .overlay(alignment: .leading) {
                        Image("errorExclamation")
                            .offset(x: -15, y: 0)
                    }
                    .font(.caption)
                    .offset(x: -125, y: -5)
            .frame(width: 366, height: 20)
            .foregroundColor(Color("errorRedText"))
    }
}

    struct OnErrorMessage_Previews: PreviewProvider {
        static var previews: some View {
            OnErrorMessage()
        }
    }
