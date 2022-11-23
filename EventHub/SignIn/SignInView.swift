//
//  SignInView.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import SwiftUI

struct LoginError {
    var mail: String = ""
    var password: String = ""
}

struct SignInView<ViewModel: SignInViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var password = ""
    @State private var mail = ""
    @State private var passwordText = ""
    @State private var mailText = ""
    @ObservedObject var emailObj = EmailValidationObj()

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
                CustomMailInput(mail: "Adresa de e-mail", mailText: $emailObj.email, icon: "envelope")
                        .padding(.top, 5)
                CustomPasswordInput(password: "Parola", passwordText: $password, icon: "key")
                    .padding(.top, -20)
                CustomPurpleButton(buttonText: "INTRĂ ÎN CONT")
                    .padding(.top, 10)
        }
            Spacer()
                HStack {
                    Text("Nu ai cont?")
                    Text("Înregistrează-te")
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
