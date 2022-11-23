//
//  CustomMailInput.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import Foundation
import SwiftUI

struct CustomMailInput: View {
    var mail: String
    var icon: String
    @FocusState var isFocused: Bool
    @Binding var mailText: String
    @ObservedObject var emailObj = EmailValidationObj()
    @ObservedObject var passObj = PasswordValidationObj()

    init(mail: String, mailText: Binding<String>, icon: String) {
        self.mail = mail
        self.icon = icon
        self._mailText = mailText
    }
    
    var body: some View {
        HStack{
            ZStack(alignment: .leading){
                Text(mail)
                    .foregroundColor(self.mailText.isEmpty ? Color("borderGrey") : Color("borderGrey"))
                    .offset(y: !isFocused && self.mailText.isEmpty ? -2 : -25)
                    .scaleEffect(!isFocused && self.mailText.isEmpty ? 1 : 0.85, anchor: .leading)
                    .animation(!isFocused && self.mailText.isEmpty ? Animation.easeInOut(duration: 0) : Animation.easeIn(duration: 0.3), value: UUID())
                TextField("", text: $emailObj.email).focused($isFocused, equals: true)
                    .padding(.top,10)
                    .textInputAutocapitalization(.never)
            }
            Image(icon).foregroundColor(Color("borderGrey"))
                .padding()
            
        }
        .padding(.top, 5)
        .padding(.leading)
        .frame(width: 366, height: 64)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 2).foregroundColor(getColor()))
        HStack {
            Text(emailObj.error)
                        .overlay(alignment: .leading) {
                            Image("errorExclamation")
                                .offset(x: -15, y: 0)
                        }
//                            .border(.black)
                            .font(.caption)
                            .offset(x: -140, y: -5)
                            .padding(.bottom, 10)
                            .padding(.top,-5)
                    .frame(width: 366, height: 20)
                .foregroundColor(Color("errorRedText"))
        }
    }
    

    
    func getColor() -> Color {
        if isFocused {
            return Color("purple")
        } else {
            return Color("borderGrey")
        }
    }
    
    //validation
    
    class EmailValidationObj: ObservableObject {
        @Published var email = "" {
            didSet {
                if self.email.isEmpty {
                    self.error = "Required"
                } else if !self.email.isValidEmail() {
                    self.error = "Invalid email"
                } else {
                    self.error = ""
                }
            }
        }
        @Published var error = ""
    }

    class PasswordValidationObj: ObservableObject {
        @Published var pass = "" {
            didSet {
                self.isValidPassword()
            }
        }
        @Published var error = ""
        private func isValidPassword() {
            guard !self.pass.isEmpty else {
                self.error = "Required"
                return
            }
            
            let setpassError = self.pass.isPassword() == false
            
            if setpassError {
                if self.pass.count < 6 {
                    self.error = "Must be at least 6 characters"
                }
    //            if !self.pass.isUpper
            } else {
                self.error = ""
            }
        }
    }
//    extension String {
        func isValidEmail() -> Bool {
                let emailRegEx =
                "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
                + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
                + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
                + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
                + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
                + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
                + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"

                let emailValidation = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
                return emailValidation.evaluate(with: self)
        }
        
        func isPassword() -> Bool {
            let passwordRegex =
            "^(?=.*[0-9])(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$"
            let passwordPred = NSPredicate(format: "SELFT MATCHES %@", passwordRegex)
            return passwordPred.evaluate(with: self)
        }
//    }
//end validation
}

struct CustomMailInput_Previews: PreviewProvider {
    static var previews: some View {
        CustomMailInput(mail: "", mailText: .constant(""), icon:"")
    }
}


