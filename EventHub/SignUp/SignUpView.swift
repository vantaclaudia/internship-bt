//
//  SignUpView.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import SwiftUI
import Firebase

struct SignUpView<ViewModel: SignUpViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
        VStack {
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
                CustomPurpleButton(buttonText: "CREEAZĂ CONT"){
                    self.viewModel.createUser()
                }
                .opacity(viewModel.isSignUpComplete ? 1 : 0.6)
                .disabled(!viewModel.isSignUpComplete)
                .padding(.top, 10)
            Text("SAU")
                .padding(.top, 15).foregroundColor(Color("borderGrey")).bold()
        }
            Spacer()
            HStack {
                Text("Ai deja un cont?")
                Button(action: {
                    self.viewModel.goToSignIn()
                }) {
                    Text("Autentifică-te").bold()
                }
                    .foregroundColor(Color("purple"))
                }
            }
        }
    }
    
//    func signUp() {
//        Auth.auth().createUser(withEmail: viewModel.mail, password: viewModel.password) { result, error in
//            if error != nil {
//                let alert = UIAlertController(title: "Error!", message: error!.localizedDescription, preferredStyle: .alert)
//                let ok = UIAlertAction(title: "OK", style: .default) { (_) in }
//                alert.addAction(ok)
//                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {})
//            }  else {
//                viewModel.goToHome()
//            }
//        }
//    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel(repository: SignUpRepository(), navigation: SignUpNavigation()))
    }
}
