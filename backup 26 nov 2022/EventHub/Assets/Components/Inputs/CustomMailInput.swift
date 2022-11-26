////
////  CustomMailInput.swift
////  EventHub
////
////  Created by Claudia Vanta on 22.11.2022.
////
//
//import Foundation
//import SwiftUI
//
//struct CustomMailInput: View {
//    var mail: String
//    var icon: String
//    @FocusState var isFocused: Bool
//    @Binding var mailText: String
//    @ObservedObject var emailObj = EmailValidationObj()
//
//    init(mail: String, mailText: Binding<String>, icon: String) {
//        self.mail = mail
//        self.icon = icon
//        self._mailText = mailText
//    }
//    
//    var body: some View {
//        HStack{
//            ZStack(alignment: .leading){
//                Text(mail)
//                    .foregroundColor(self.emailObj.email.isEmpty ? Color("borderGrey") : getErrorColor())
//                    .offset(y: !isFocused && self.emailObj.email.isEmpty ? -2 : -25)
//                    .scaleEffect(!isFocused && self.emailObj.email.isEmpty ? 1 : 0.85, anchor: .leading)
//                    .animation(!isFocused && self.emailObj.email.isEmpty ? Animation.easeInOut(duration: 0) : Animation.easeIn(duration: 0.3), value: UUID())
//                TextField("", text: $mailText).focused($isFocused, equals: true)
//                TextField("", text: $emailObj.email).focused($isFocused, equals: true)
//                    .padding(.top, 5)
//                    .textInputAutocapitalization(.none)
//            }
//            Image(icon).colorMultiply(self.emailObj.email.isEmpty ? Color("borderGrey") : getErrorColor())
//                .padding()
//        }
//        .padding(.top, 5)
//        .padding(.leading)
//        .frame(width: 366, height: 64)
//        .background(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 2).foregroundColor(getErrorColor()))
//        HStack {
//            Text(emailObj.error)
//                .font(.caption)
//                .offset(x: -140, y: -5)
//                .padding(.top, 10)
//                .frame(width: 366, height: 0)
//                .foregroundColor(Color("errorRedText"))
//        }
//    }
//    
//    func getColor() -> Color {
//        if isFocused{
//            return Color("purple")
//        } else {
//            return Color("borderGrey")
//        }
//    
//    }
//
//    func getErrorColor() -> Color {
//        if self.emailObj.error.isEmpty && !isFocused  {
//            return Color("borderGrey")
//        } else if self.emailObj.error.isEmpty && isFocused && !self.emailObj.error.isValidEmail() {
//            return Color("purple")
//        } else if !self.emailObj.error.isValidEmail() {
//            return Color("errorRedText")
//        } else {
//            return Color("borderGrey")
//        }
//    }
//}
//
//struct CustomMailInput_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomMailInput(mail: "", mailText: .constant(""), icon:"")
//    }
//}
//
//
