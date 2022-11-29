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
            VStack(alignment: .leading){
                HStack {
                    Text("\(releaseDate, formatter: self.stackDateFormat)").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12)).textCase(.uppercase)
                    Image("cloud")
                    Text("16°C").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 13))
                }.padding(.top, -20)
                HStack{
                    Text("Oradea, România").fontWeight(.bold).foregroundColor(.white).font(.system(size: 24)).padding(.top, -10)
                    HStack{
                        Image("gps").foregroundColor(.black).padding(-10)
                        Text("Schimbă").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12))
                    }.padding(.leading, 90).padding(.bottom, 20)
                }
                HStack {
                    Text("").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 12))
                    Image("")
                    Text("").fontWeight(.bold).foregroundColor(Color("lightPurple")).font(.system(size: 13))
                }
                HStack{
                    SearchSettingsComponent()
                }
                .padding(.top, -20)
                HStack{
                    //colored buttons
                }.padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("darkPurple")]), startPoint: .top, endPoint: .bottom).cornerRadius(33).ignoresSafeArea(edges: .top)
            )
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(repository: HomeRepository(), navigation: HomeNavigation()))
    }
}
