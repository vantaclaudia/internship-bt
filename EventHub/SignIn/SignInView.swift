//
//  SignInView.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import SwiftUI

struct SignInView<ViewModel: SignInViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
//    @State private var signInViewModel = ViewModel
    
//    @State private var mailText = ""
//    @State private var passwordText = ""
//    @ObservedObject var emailObj = EmailValidationObj()
//    @ObservedObject var passObj = PasswordValidationObj()

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
                GenericInput(placeholder: "Adresa de e-mail", icon: "envelope", errorMessage: "",isSecure: false, text: $viewModel.mail)
                    .padding(.top, 5)
                GenericInput(placeholder: "Parola", icon: "key", errorMessage: "", isSecure: true, text: $viewModel.password)
                    .padding(.top, 5)
                CustomPurpleButton(buttonText: "INTRĂ ÎN CONT")
//                { }
                    .padding(.top, 10)
                Text("SAU")
                    .padding(.top, 15).foregroundColor(Color("borderGrey")).bold()
        }
            Spacer()
                HStack {
                    Text("Nu ai cont?")
                    Button(action: {
                        //action
                    }) {
                        Text("Înregistreaza-te").bold()
                    }
                        .foregroundColor(Color("purple"))
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel(repository: SignInRepository(), navigation: SignInNavigation()))
    }
}
