//
//  CreateEventView.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

struct CreateEventView<ViewModel: CreateEventViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Text("test")
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView(viewModel: CreateEventViewModel(repository: CreateEventRepository(), navigation: CreateEventNavigation()))
    }
}
