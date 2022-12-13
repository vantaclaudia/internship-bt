//
//  CreateEventView.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI
import PhotosUI

struct CreateEventView<ViewModel: CreateEventViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                ScrollView(showsIndicators: false) {
                    EventHead() {viewModel.goToHome()}.padding(.top, 55)
                    PhotoPicker().padding(.top, 70).padding(.bottom, 73)
                    GenericInput(placeholder: "Nume eveniment", icon: "pencil", errorMessage: "", isSecure: false, text: $viewModel.eventName)
                    DateTimePicker(placeholder: "Dată eveniment").padding(.top, -3).padding(.bottom, -3)
                    TimePicker(placeholder: "Oră eveniment").padding(.bottom, -13)
                    GenericInput(placeholder: "Locație eveniment", icon: "pin", errorMessage: "", isSecure: false, text: $viewModel.placeName).disabled(true).padding(.top, 10)
                    Participants(placeholder: "Număr de participanți", icon: "user", text: $viewModel.participants).padding(.top, -21)
                    PureTextInput(placeholder: "Descriere eveniment", icon: "file", errorMessage: "", isSecure: false, text: $viewModel.description).padding(.top, -3)
                    CustomPurpleButton(buttonText: "CREEAZĂ EVENIMENT") {viewModel.addEventToDB()}.padding(.top, -35)
                }
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView(viewModel: CreateEventViewModel(repository: CreateEventRepository(), navigation: CreateEventNavigation()))
    }
}
