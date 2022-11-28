//
//  SignInView.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import SwiftUI
import Firebase

struct SignInView<ViewModel: SignInViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
        VStack {
            VStack {
                Image("splashScreen-logo")
                    .resizable()
                    .frame(width: 240, height: 72)
                    .scaledToFit()
                    .padding(.bottom, 30)
            }
            VStack {
                Text("Autentifică-te").bold()
                    .font(.system(size: 24))
                    .lineSpacing(29)
                    .frame(width: 360, height: 29, alignment: .topLeading)
            }
            VStack {
                GenericInput(placeholder: "Adresa de e-mail", icon: "envelope", errorMessage: viewModel.emailPrompt, isSecure: false, text: $viewModel.mail)
                .padding(.top, 5)
                GenericInput(placeholder: "Parola", icon: "key", errorMessage: viewModel.passwordPrompt, isSecure: true, text: $viewModel.password)
                .padding(.top, 5)
                CustomPurpleButton(buttonText: "INTRĂ ÎN CONT") {
                    signIn()
                }
                    .padding(.top, 10)
                Text("SAU")
                    .padding(.top, 15).foregroundColor(Color("borderGrey")).bold()
        }
            Spacer()
                HStack {
                    Text("Nu ai cont?")
                    Button(action: {
                        viewModel.goToSignUp()
                    }) {
                        Text("Înregistreaza-te").bold()
                    }
                        .foregroundColor(Color("purple"))
                }
            }
        }
    }
    
    func signIn() {
        Auth.auth().createUser(withEmail: viewModel.mail, password: viewModel.password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel(repository: SignInRepository(), navigation: SignInNavigation()))
    }
}
