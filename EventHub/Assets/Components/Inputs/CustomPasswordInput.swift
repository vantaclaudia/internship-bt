////
////  CustomMailButton.swift
////  EventHub
////
////  Created by Claudia Vanta on 22.11.2022.
////
//
//import Foundation
//import SwiftUI
//
//struct CustomPasswordInput: View {
//    var password: String
//    var icon: String
//    @FocusState var isFocused: Bool
//    @Binding var passwordText: String
//    @ObservedObject var passObj = PasswordValidationObj()
//    
//    init(password: String, passwordText: Binding<String>, icon: String) {
//        self.password = password
//        self.icon = icon
//        self._passwordText = passwordText
//    }
//    
//    var body: some View {
//        HStack{
//            ZStack(alignment: .leading){
//                Text(password)
//                    .foregroundColor(self.passObj.pass.isEmpty ? Color("borderGrey") : getErrorColor())
//                    .offset(y: !isFocused && self.passObj.pass.isEmpty ? -2 : -25)
//                    .scaleEffect( !isFocused && self.passObj.pass.isEmpty ? 1 : 0.85, anchor: .leading)
//                    .animation(!isFocused && self.passObj.pass.isEmpty ? Animation.easeInOut(duration: 0) : Animation.easeIn(duration: 0.3), value: UUID())
//                SecureField("", text: $passwordText).focused($isFocused, equals: true)
//                SecureField("", text: $passObj.pass).focused($isFocused, equals: true)
//                    .textInputAutocapitalization(.none)
//            }
//            Image(icon).foregroundColor(self.passObj.pass.isEmpty ? Color("borderGrey") : getErrorColor())
//                    .padding()
//        }
//        .padding(.top, 5)
//        .padding(.leading)
//        .frame(width: 366, height: 64)
//        .background(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 2).foregroundColor(getErrorColor()))
//        HStack {
//            Text(passObj.error)
//                .font(.caption)
//                .offset(x: -140, y: -5)
//                .padding(.top, 10)
//                .frame(width: 366, height: 0)
//                .foregroundColor(Color("errorRedText"))
//        }
//    }
//    
//    func getColor() -> Color {
//        if isFocused {
//            return Color("purple")
//        } else {
//            return Color("borderGrey")
//
//        }
//    }
//    
//    func getErrorColor() -> Color {
//        if self.passObj.error.isEmpty && !isFocused  {
//            return Color("borderGrey")
//        } else if self.passObj.error.isEmpty && isFocused && !self.passObj.error.isPassword() {
//            return Color("purple")
//        } else if !self.passObj.error.isPassword() {
//            return Color("errorRedText")
//        } else {
//            return Color("borderGrey")
//        }
//    }
//    
//}
//
//    struct customPasswordInput_Previews: PreviewProvider {
//        static var previews: some View {
//            CustomPasswordInput(password: "", passwordText: .constant(""), icon:"")
//        }
//    }
