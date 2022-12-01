//
//  SignUpView.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    let releaseDate = Date()
    let stackDateFormat: DateFormatter = {
    let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM"
        formatter.locale = Locale(identifier: "ro_RO")
        return formatter
    }()
    
    var body: some View {
            VStack {
                // START TOP NAVIGATION
                VStack(alignment: .leading){
                    HStack {
                        Text("\(releaseDate, formatter: self.stackDateFormat)").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12)).textCase(.uppercase)
                        Image("cloud")
                        Text("16°C").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 13))
                    }.padding(.top, -20)
                    HStack{
                        Text("Oradea, România").fontWeight(.bold).foregroundColor(.white).font(.system(size: 24)).padding(.top, -20)
                        HStack{
                            Image("gps").foregroundColor(.black).padding(-10)
                            Text("Schimbă").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12))
                        }.padding(.leading, 90).padding(.bottom, 20)
                    }
                    HStack{
                        SearchSettingsComponent(searchText: $viewModel.searchText)
                    }
                    .padding(.top, -10)
                    HStack{
                        ColoredButton(buttonText: "Astăzi", buttonColor: Color("lightGreen"))
                        ColoredButton(buttonText: "Mâine", buttonColor: Color("lightOrange"))
                        ColoredButton(buttonText: "Săptămâna aceasta", buttonColor: Color("errorRedText"))
                    }
                    .padding(.bottom, -10)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("darkPurple")]), startPoint: .top, endPoint: .bottom).cornerRadius(33).ignoresSafeArea(edges: .top)
                )
                .frame(maxWidth: .infinity)
                // END TOP NAVIGATION
                
                ScrollView(showsIndicators: false) {
                // TOP 10 EVENIMENTE
                VStack(alignment: .leading) {
                    HStack {
                        Text("Top 10 evenimente în această săptămână")
                            .font(.system(size: 16))
                    }.padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        TopTenEvents()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 13)
                .padding(.bottom, 15)
                    
                // EVENIMENTE POPULARE
                VStack(alignment: .leading) {
                    HStack {
                        Text("Evenimente populare 🔥")
                            .font(.system(size: 16))
                    }.padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        PopularEvents()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.bottom, 15)
                    
                // EVENIMENT RECOMANDAT
                VStack(alignment: .leading) {
                    HStack {
                        Text("Eveniment recomandat 🌟")
                            .font(.system(size: 16))
                    }.padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        RecomandedEvents()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 13)
                    
                // ADAUGA EVENIMENT
                HStack{
                    AddEvent().padding(.top, 10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                    
                //BOTTOM BAR
                HStack{
                    BottomBar()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
            }
        }.background(Color("dashboardBackground"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(repository: HomeRepository(), navigation: HomeNavigation()))
    }
}
