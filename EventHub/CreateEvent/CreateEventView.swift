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
    @State var placeName: String = "Oradea, România"
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    HStack {
                        HStack {
                            Button {
                                //action
                            } label: {
                                Image("close")
                                    .renderingMode(.template)
                                    .foregroundColor(Color.black)
                            }
                            .frame(width: 40, height: 40)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 0).background(Color("fadedBlack")))
                            .cornerRadius(20)
                            .padding(.leading, -90)
                        }
                        HStack{
                            Text("Evenimentul tău")
                                .fontWeight(.semibold)
                                .font(.system(size: 24))
                                .multilineTextAlignment(.center)
                        }
                    }.padding(.top, 50)
                    PhotoPicker().padding(.top, 70).padding(.bottom, 73)
                    GenericInput(placeholder: "Nume eveniment", icon: "pencil", errorMessage: "", isSecure: false, text: $viewModel.eventName)
                    DateTimePicker(placeholder: "Dată eveniment").padding(.top, -13).padding(.bottom, -3)
                    TimePicker(placeholder: "Oră eveniment").padding(.bottom, -13)
                    GenericInput(placeholder: "Locație eveniment", icon: "pin", errorMessage: "", isSecure: false, text: $placeName).disabled(true).padding(.top, 10)
                    GenericInput(placeholder: "Număr de participanți", icon: "user", errorMessage: "", isSecure: false, text: $viewModel.participants).padding(.top, -23)
                    PureTextInput(placeholder: "Descriere eveniment", icon: "file", errorMessage: "", isSecure: false, text: $viewModel.description)
                        .padding(.top, -13)
                    CustomPurpleButton(buttonText: "CREEAZĂ EVENIMENT") {
                        //action
                    }.padding(.top, -38)
                }
            }.navigationBarBackButtonHidden(true).ignoresSafeArea(edges: .top)
        }
        
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView(viewModel: CreateEventViewModel(repository: CreateEventRepository(), navigation: CreateEventNavigation()))
    }
}
