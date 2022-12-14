//
//  EventDetailsView.swift
//  EventHub
//
//  Created by Claudia Vanta on 08.12.2022.
//

import SwiftUI

struct EventDetailsView<ViewModel: EventDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                ScrollView(showsIndicators: false) {
                    HeadEventDetails()
                    ParticipatePurpleButton() { }
                    Divider()
                        .padding(.top, 25)
                        .frame(width: 366)
                    DetailsOfEvent()
                    Divider()
                        .frame(width: 366)
                        .padding(.bottom)
                    OrganiserDetailsEvent() { }
                    Divider()
                        .frame(width: 366)
                        .padding(.bottom)
                        .padding(.top)
                    MoreSimilarEvents()
                }
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(viewModel: EventDetailsViewModel(repository: EventDetailsRepository(), navigation: EventDetailsNavigation()))
    }
}
