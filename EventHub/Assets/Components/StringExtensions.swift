////
////  StringExtensions.swift
////  EventHub
////
////  Created by Claudia Vanta on 22.11.2022.
////
//
//import UIKit
//
//class EmailValidationObj: ObservableObject {
//    @Published var email = "" {
//        didSet {
//            if self.email.isEmpty {
//                self.error = ""
//            } else if !self.email.isValidEmail() {
//                self.error = "Invalid email"
//            } else {
//                self.error = ""
//            }
//        }
//    }
//    @Published var error = ""
//}
//
//class PasswordValidationObj: ObservableObject {
//    @Published var pass = "" {
//        didSet {
//            self.isValidPassword()
//        }
//    }
//    
//    @Published var error = ""
//    
//    private func isValidPassword() {
//        guard !self.pass.isEmpty else {
//            self.error = "Required"
//            return
//        }
//        
//        let setPassError = self.pass.isPassword() == false
//        
//        if setPassError {
//            if self.pass.count < 6 {
//                self.error = "Must be at least 6 characters"
//            }
//            if !self.pass.isUpperCase() {
//                self.error = "Mulst contain at least one uppercase"
//            } else {
//                self.error = ""
//            }
//        }
//    }
//}
//
//extension String {
//    func isValidEmail() -> Bool {
//            let emailRegEx =
//            "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
//            + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
//            + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
//            + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
//            + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
//            + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
//            + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//
//            let emailValidation = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
//            return emailValidation.evaluate(with: self)
//    }
//    
//    func isPassword() -> Bool {
//        let passwordRegex =
//        "^(?=.*[0-9])(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$"
//        let passwordValidation = NSPredicate(format: "SELFT MATCHES %@", passwordRegex)
//        return passwordValidation.evaluate(with: self)
//    }
//    
//    func isUpperCase() -> Bool {
//        let uppercaseReqRegex = ".*[A-Z]+.*"
//        return NSPredicate(format: "SELFT MATCHES %@", uppercaseReqRegex).evaluate(with: self)
//    }
//}
