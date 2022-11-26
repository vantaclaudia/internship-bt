//
//  SignUpView.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import SwiftUI

struct SignUpView<ViewModel: SignUpViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
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
                Text("Înregistrează-te").bold()
                    .font(.system(size: 24))
                    .lineSpacing(29)
                    .frame(width: 360, height: 29, alignment: .topLeading)
            }
            VStack {
                GenericInput(placeholder: "Numele și Prenumele", icon: "user", errorMessage: "", isSecure: false, text: $viewModel.userName)
                .padding(.top, 5)
                GenericInput(placeholder: "Adresa de e-mail", icon: "envelope", errorMessage: viewModel.emailPrompt, isSecure: false, text: $viewModel.mail)
                .padding(.top, 5)
                GenericInput(placeholder: "Parola", icon: "key", errorMessage: viewModel.passwordPrompt, isSecure: true, text: $viewModel.password)
                .padding(.top, 5)
                GenericInput(placeholder: "Confirmă parola", icon: "key", errorMessage: viewModel.confirmPrompt, isSecure: true, text: $viewModel.confirmPassword)
                .padding(.top, 5)
            CustomPurpleButton(buttonText: "CREEAZĂ CONT")
//                { }
                .padding(.top, 10)
            Text("SAU")
                .padding(.top, 15).foregroundColor(Color("borderGrey")).bold()
        }
            Spacer()
            HStack {
                Text("Ai deja un cont?")
                Button(action: {
                    //action
                }) {
                    Text("Autentifică-te").bold()
                }
                    .foregroundColor(Color("purple"))
            }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel(repository: SignUpRepository(), navigation: SignUpNavigation()))
    }
}
